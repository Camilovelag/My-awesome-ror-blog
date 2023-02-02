Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  # root 'users#index'
  devise_for :users
  root 'users#index'
  resources :users, only: [:show, :index] do
    resources :posts, only: [:show, :index, :new, :create] do
      resources :comments, only: [:new, :create]
      resources :likes, only: [:create]
    end
  end
end
