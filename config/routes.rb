Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "items#index"
  resources :signup do
    collection do
      get "step1"
      get "step2"
    end
  end
  resources :mypage, only: [:index] do
    collection do
      get "logout"
    end
  end
end
