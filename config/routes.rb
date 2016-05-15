Rails.application.routes.draw do
  get    "login"   => "sessions#new"
  post   "login"   => "sessions#create"
  delete "logout"  => "sessions#destroy"
  resources :members do
    resources :posts, only: [:index]
  end

  resources :posts, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :comments, only: [:create]
  resources :topics, only: [:index, :show]
  resources :notifications, only: [:index]
  resources :statistics, only: [:index]

  root "topics#index"
  get "search" => "search#index"
end
