Rails.application.routes.draw do
  # get 'registrations/:devise'

  root to: "home#index"
  get 'home/index', as: 'user_root'
  # devise_for :users do
  #   get '/users/sign_out' => 'devise/sessions#destroy'
  # end

  devise_for :users, :controllers => { registrations: 'registrations' }

  
end
