
Rails.application.routes.draw do
  devise_for :users, skip: [:sessions, :registrations], controllers: { confirmations: 'confirmations' }
  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new', as: :new_user_session
    post 'sign_in', to: 'devise/sessions#create', as: :user_session
    delete 'logout', to: 'devise/sessions#destroy', as: :destroy_user_session

    get 'sign_up', to: 'registrations#new', as: :new_user_registration
    post 'sign_up', to: 'registrations#create', as: :user_registration
    get 'settings/account', to: 'registrations#edit', as: :edit_user_registration
    put 'sign_up', to: 'registrations#update'
    delete 'sign_up', to: 'registrations#destroy'
  end

  resources :profiles, only: :update
  resources :songs, only: [:new, :create, :destroy] do
    member do
      put 'like_song', to: 'likes#create', as: :like
      put 'unlike_song', to: 'likes#destroy', as: :unlike
    end
  end

  get 'settings/profile', to: 'profiles#edit', as: :edit_profile
  get ':username', to: 'users#show', as: :user
  get ':username/likes', to: 'likes#show', as: :user_likes
  get ':username/followers', to: 'follows#followers', as: :get_followers
  get ':username/following', to: 'follows#following', as: :get_following

  post ':username/follow_user', to: 'follows#create', as: :follow_user
  post ':username/unfollow_user', to: 'follows#destroy', as: :unfollow_user

  root 'home#index'
end
