Rails.application.routes.draw do
  resources :classifieds
  resources :properties
  resources :items
  resources :auctions
  resources :users
  post '/login', to: 'auth#create'
  post '/auto_login', to: 'auth#auto_login'
  get '/logged_in', to: 'application#logged_in?'
 
end
