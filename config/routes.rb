Rails.application.routes.draw do
#   devise_for :users, controllers: {
#     sessions: 'users/sessions',
#     registrations: 'users/registrations',
#   }
#   devise_scope :user do
#     get 'sign_in', to: 'users/sessions#new'
#     get 'sign_up', to: 'users/registrations#new'
#     get 'forgot_password', to: 'users/passwords#new'
#     get 'reset_password', to: 'users/passwords#edit'


# end


  # devise_for :users
  root to: "home#index"
  get 'home/index', as: 'user_root'
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  
end
