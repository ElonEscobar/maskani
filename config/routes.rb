Rails.application.routes.draw do
  resources :classifieds
  resources :properties
  resources :items
  resources :auctions
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
