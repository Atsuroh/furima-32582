Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items, except: :index do
    resources :comments, only: [:create, :destroy]
    resources :deliveries, only: [:index, :create]
  end
end