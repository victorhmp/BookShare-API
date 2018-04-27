Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :items
      resources :lists
      devise_for :users
    end
  end
end
