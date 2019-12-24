class ApplicationController < ActionController::Base
    before_action :basic_auth
    before_action :configure_permitted_parameters, if ::devise_controller?
  
    private
  
    def basic_auth
      authenticate_or_request_with_http_basic do |username, password|
        username == 'teamd' && password == 'mercari'
      end
    end
  
    def configure_permitted_parameters
      added_attrs = [ :nickname, 
                      :family_name,
                      :first_name,
                      :family_name_kana, 
                      :first_name_kana, 
                      :phone_tel,
                      :authentication_number,
                      :postal_code,
                      :prefecture,
                      :city,
                      :block,
                      :building,
                      :building_tel,
                      :profile
                     ]
      devise.parameter.sanitizer.permit :sign_up, keys: added_attrs
    end
  
  end
  
