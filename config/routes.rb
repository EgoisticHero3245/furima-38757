Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  resources :users, only: [:edit, :update]
end
