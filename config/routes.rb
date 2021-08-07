Rails.application.routes.draw do
  root to: 'posts#index'
  get 'signup', to: 'users#new'
  resources :users
  resources :categories
  resources :posts do
    resources :comments
  end
end
