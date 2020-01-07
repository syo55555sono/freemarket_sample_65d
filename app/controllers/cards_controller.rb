class CardsController < ApplicationController
  before_action :set_card
  require "payjp"

  def index
  end
   
  def new
    # if @card
    #   redirect_to step6_signup_index_path, unless @card
    # else
    #   render '/'
  end

  # 登録画面で入力した情報をDBに保存
  def create
    Payjp.api_key = "sk_test_b8fbe5518b21011b0d3bbe47"
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
        email: current_user.email,
        card: params['payjp-token']
        # metadata: {user_id: current_user.id}
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: "show"
        flash[:notice] = 'クレジットカードの登録が完了しました'
      else
        redirect_to action: "create"
        flash[:alert] = 'クレジットカード登録に失敗しました'
      end
    end
  end

  def show
    card = current_user.credit_card
    if card.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = "sk_test_b8fbe5518b21011b0d3bbe47"
      customer = Payjp::Customer.retrieve(card.customer_id)
      @customer_card = customer.cards.retrieve(card.card_id)
    end
  end

  def destroy
  end

  private

  def set_card
    # @card = Card.where(user_id: current_user.id).first if Card.where(user_id: current_user.id).present?
  end
end
