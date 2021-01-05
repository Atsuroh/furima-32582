Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :users, only: :show
  resources :items do
    resources :purchases, only: [:index, :create]
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
  end
end