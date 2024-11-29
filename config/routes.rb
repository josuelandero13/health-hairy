# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ('/')
  root 'home#welcome'

  namespace :authentication, as: '', path: '' do
    resources :users, only: %i[new create edit update],
                      path: '/register',
                      path_names: { new: '/' }

    resources :sessions, only: %i[new create destroy],
                         path: '/login',
                         path_names: { new: '/' }

    resources :passwords, only: %i[edit update],
                          path: '/password',
                          path_names: { edit: '/' }

    get '/password_resets/edit', to: 'password_resets#edit',
                                 as: 'edit_password_reset'
    resources :password_resets, only: %i[new create],
                                path: '/password_resets',
                                path_names: { new: '/' }
    patch '/password_resets', to: 'password_resets#update'
  end

  resources :appointment_types
  resources :cities
  resources :locals
  resources :pets
end
