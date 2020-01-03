class SignupController < ApplicationController
  def step1
    @user = User.new
  end

  def step2
    @user = User.new
    
  end

  def step3
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:family_name] = user_params[:family_name]
    session[:first_name] = user_params[:first_name]
    session[:family_name_kana] = user_params[:family_name_kana]
    session[:first_name_kana] = user_params[:first_name_kana]
    session[:birth_yyyy] = user_params[:birth_yyyy]
    session[:birth_mm] = user_params[:birth_mm]
    session[:birth_dd] = user_params[:birth_dd]
    @user = User.new
  end

  def step4
    session[:phone_tel] = user_params[:phone_tel]
    @user = User.new
  end

  def create
    session[:family_name] = user_params[:family_name]
    session[:first_name] = user_params[:first_name]
    session[:family_name_kana] = user_params[:family_name_kana]
    session[:first_name_kana] = user_params[:first_name_kana]
    session[:postal_code] = user_params[:postal_code]
    session[:prefecture] = user_params[:prefecture]
    session[:city] = user_params[:city]
    session[:block] = user_params[:block]
    session[:building] = user_params[:building]
    session[:building_tel] = user_params[:building_tel]
    @user = User.new(

    nickname: session[:nickname],
    email: session[:email],
    password: session[:password],
    password_confirmation: session[:password_confirmation],
    family_name: session[:family_name],
    first_name: session[:first_name],
    family_name_kana: session[:family_name_kana],
    first_name_kana: session[:first_name_kana],
    birth_yyyy: session[:birth_yyyy],
    birth_mm: session[:birth_mm],
    birth_dd: session[:birth_dd],
    phone_tel: session[:phone_tel],
    postal_code: user_params[:postal_code],
    prefecture: user_params[:prefecture],
    city: user_params[:city],
    block: user_params[:block],
    building: user_params[:building],
    building_tel: user_params[:building_tel],
    )
    
    if @user.save
      session[:id] = @user.id
      redirect_to step5_signup_index_path
    else
      render '/signup/step4'
    end
  end

  def step5
    session[:family_name] = user_params[:family_name]
    session[:first_name] = user_params[:first_name]
    session[:family_name_kana] = user_params[:family_name_kana]
    session[:first_name_kana] = user_params[:first_name_kana]
    session[:postal_code] = user_params[:postal_code]
    session[:prefecture] = user_params[:prefecture]
    session[:city] = user_params[:city]
    session[:block] = user_params[:block]
    session[:building] = user_params[:building]
    session[:building_tel] = user_params[:building_tel]
    @user = User.new
  end


private
  def user_params
    params.require(:user).permit(
      :nickname,
      :email,
      :password,
      :family_name,
      :first_name,
      :family_name_kana,
      :first_name_kana,
      :birth_yyyy,
      :birth_mm,
      :birth_dd,
      :phone_tel,
      :authentication_number,
      :postal_code,
      :prefecture,
      :city,
      :block,
      :building,
      :building_tel
    )
  end

end
