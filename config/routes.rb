Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :admin do
    root to: "admin#index"
    resources :store
    resources :restaurant
  end

  root to: "home#index"
end
