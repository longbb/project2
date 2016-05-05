Rails.application.routes.draw do
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources :members do
    resources :posts, only: [:index]
  end

  resources :posts, only: [:show, :new, :create, :edit, :update]

  root "sessions#new"
end
