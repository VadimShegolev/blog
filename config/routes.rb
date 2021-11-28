Rails.application.routes.draw do
  resources :feeds
  resources :comments
  resources :posts do
    member do
      put "like" => "posts#upvote"
      put "unlike" => "posts#downvote"
    end
  end

  root to: "home#index"
  get 'home/index', as: 'user_root'

  devise_for :users, :controllers => { registrations: 'registrations' }

  get '/posts/hashtag/:name', to:'posts#hashtags'
  
end
