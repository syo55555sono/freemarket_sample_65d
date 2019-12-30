Rails.application.routes.draw do
  devise_for :users,
  controllers: { passwords: 'users/passwords',
                 registrations: 'users/registrations' ,
                 sessions: 'users/sessions'
                }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "items#index"
  resources :signup, only: [:index, :create] do
    collection do
      get "step1"
      get "step2"
      get "step3"
      get "step4"
      get "step5"
    end
  end
end
