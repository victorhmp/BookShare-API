Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :items
      resources :lists
    end
  end
  devise_for :users, defaults: { format: :json }
end
