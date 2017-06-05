Rails.application.routes.draw do
  devise_for :users, skip: [:sessions, :registrations]
  devise_scope :user do
    get '/sign_in', to: 'devise/sessions#new', as: :new_user_session
    post '/sign_in', to: 'devise/sessions#create', as: :user_session
    delete '/logout', to: 'devise/sessions#destroy', as: :destroy_user_session

    get '/sign_up', to: 'users/registrations#new', as: :new_user_registration
    post '/sign_up', to: 'users/registrations#create', as: :user_registration
    get '/settings/account', to: 'devise/registrations#edit', as: :edit_user_registration
    put '/sign_up', to: 'devise/registrations#update'
    delete '/sign_up', to: 'devise/registrations#destroy'
  end

  resources :profiles, except: :edit

  get '/settings/profile', to: 'profiles#edit', as: :edit_profile

  root 'home#index'
end
