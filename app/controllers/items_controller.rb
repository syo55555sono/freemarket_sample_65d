class ItemsController < ApplicationController
  # before_action :set_item

  def index
  end

  def new
    @item = Item.new
    @item_image = @item.images.build
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render 'items/new'
    end
  end

private

  def item_params
    params.require(:item).permit(
      :category_id,
      :brand_id,
      :condition_id,
      :shippingfee_id,
      :prefecture_id,
      :shippingday_id,
      :item_name,
      :description,
      :price,
      images: []
    )
  end
  
  # 商品情報
  def set_item
    # @item = Item.find(params[:item_id])
  end

  # # ユーザー情報
  # def set_user
  #   @user = User.find(@item.user_id)
  # end
end
