Rails.application.routes.draw do
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
  resources :wishlists
  # devise_for :users, defaults: { format: :json }
end
