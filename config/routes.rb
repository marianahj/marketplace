Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    root to: "admin#index"
    resources :stores
    resources :restaurants
  end

  resources :profiles, only: [:show, :edit, :update]

  root to: "home#index"
end
