Rails.application.routes.draw do
  resources :classifieds, only: [:index, :update, :create, :destroy]
  resources :properties, only: [:index, :update, :create, :destroy]
  resources :items, only: [:index, :update, :create, :destroy]
  resources :auctions, only: [:index, :update, :create, :destroy]
  resources :users, only: [:index, :update, :show, :create, :destroy]
  post '/login', to: 'auth#create'
  post '/auto_login', to: 'auth#auto_login'
  get '/logged_in', to: 'application#logged_in?'
  
end
