Rails.application.routes.draw do
  resources :reviews
  resources :reservations
  resources :payments
  resources :mpesas
  resources :messages
  resources :items
  resources :hostels
  resources :users

  get "/hostels/:hostel_id/price_per_day", to: "reservations#price_per_day"
  get "/hostels/:hostel_id/reservations/:reservation_id/index_for_reservation", to: "reviews#index_for_reservation"

  # Mpesa routes
  post "stkpush", to: "mpesas#stkpush"
  post "stkquery", to: "mpesas#stkquery"

  resources :items, only: [:create, :index]
  resources :users do
    get "/messages", to: "messages#index_for_user"
    post "add_to_wishlist", to: "users#add_to_wishlist"
    post "remove_from_wishlist", to: "users#remove_from_wishlist"
  end

  get "/me", to: "users#show"
  patch "/updateimage/:id", to: "users#update_image", as: :update_image
  post "/signup", to: "users#create"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  patch "/reset", to: "users#update"
  patch "/changePass", to: "users#changePass"

  get "/hello", to: "application#hello_world"
end
