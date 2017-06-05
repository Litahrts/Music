Rails.application.routes.draw do
  devise_for :users, skip: [:sessions, :registrations]
  devise_scope :user do
    get '/sign_in', to: 'devise/sessions#new', as: :new_user_session
    post '/sign_in', to: 'devise/sessions#create', as: :user_session
    delete '/logout', to: 'devise/sessions#destroy', as: :destroy_user_session

    get '/sign_up', to: 'registrations#new', as: :new_user_registration
    post '/sign_up', to: 'registrations#create', as: :user_registration
    get '/settings/account', to: 'registrations#edit', as: :edit_user_registration
    put '/sign_up', to: 'registrations#update'
    delete '/sign_up', to: 'registrations#destroy'
  end

  resources :profiles, only: :update

  get '/settings/profile', to: 'profiles#edit', as: :edit_profile
  get '/:username', to: 'users#show', as: :user

  root 'home#index'
end
