Rails.application.routes.draw do
  resources :feeds
  resources :comments
  resources :posts
  # get 'registrations/:devise'

  root to: "home#index"
  get 'home/index', as: 'user_root'
  # devise_for :users do
  #   get '/users/sign_out' => 'devise/sessions#destroy'
  # end

  devise_for :users, :controllers => { registrations: 'registrations' }

  get '/posts/hashtag/:name', to:'posts#hashtags'
  
end
