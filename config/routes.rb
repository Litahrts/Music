Rails.application.routes.draw do
  devise_for :users

  resources :users, only: :show do
    member do
      get 'followers', to: 'follows#followers', as: :get_followers
      get 'following', to: 'follows#following', as: :get_following
    end
  end

  post ':id/follow_user', to: 'follows#create', as: :follow_user
  post ':id/unfollow_user', to: 'follows#destroy', as: :unfollow_user

  root 'home#index'
end
