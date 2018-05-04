Rails.application.routes.draw do
  resources :offers
  resources :advertisements
  namespace :api do
    namespace :v1 do
      resources :items
      resources :lists
    end
  end
  post '/login' => "sessions#create"
  delete '/logout' => "sessions#destroy"
  resources :users
  get 'profile' => "users#profile"
  resources :wishlists do
    collection do
      get '/user/:id', to: 'wishlists#show_by_user'
    end
  end
  resources :wishlist_items do
    collection do
      get '/wishlist/:id', to: 'wishlist_items#show_by_wishlist'
    end
  end
  # devise_for :users, defaults: { format: :json }
end
