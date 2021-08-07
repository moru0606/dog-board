Rails.application.routes.draw do
  root to: 'posts#index'
  resources :categories
  resources :posts do
    resources :comments
  end
end
