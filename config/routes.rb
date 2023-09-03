Rails.application.routes.draw do
  resources :reviews
  resources :reservations
  resources :payments
  resources :mpesas
  resources :messages
  resources :items
  resources :hostels
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
