Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  # root 'users#index'
  root 'users#index'
  resources :users, only: [:show, :index] do
    resources :posts, only: [:show, :index, :new, :create] do
      resources :comments, only: [:new, :create]
    end
  end

  put '/users/:user_id/posts/:post_id/like', to: 'posts#like', as: 'like'
end
