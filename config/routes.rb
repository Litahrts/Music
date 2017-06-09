Rails.application.routes.draw do
  get 'users/show'

  devise_for :users

  resources :users

  post ':id/follow_user', to: 'follows#create', as: :follow_user
  post ':id/unfollow_user', to: 'follows#destroy', as: :unfollow_user

  root 'home#index'
end
