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
  get '/profile' => "users#profile"
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
  resources :advertisements do
    collection do
      get '/feed', to: 'advertisements#feed'
      get '/user/my', to: 'advertisements#show_mine'
      get '/user/:id', to: 'advertisements#show_by_user'

      post '/close', to: 'advertisements#close'
    end
  end
  resources :offers do
    collection do
      get '/user/my', to: 'offers#show_mine'
      get '/user/:id', to: 'offers#show_by_user'
      get '/advertisement/:id', to: 'offers#show_by_advertisement'

      post '/cancel', to: 'offers#cancel'
      post '/decline', to: 'offers#decline'
    end
  end
  resources :trades do
    collection do
      get '/advertisement/:id', to: 'trades#show_by_advertisement'
      get '/offer/:id', to: 'trades#show_by_offer'
      get '/user/my', to: 'trades#show_mine'
    end
  end
  # devise_for :users, defaults: { format: :json }
end
