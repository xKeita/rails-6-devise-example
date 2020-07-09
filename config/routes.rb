# frozen_string_literal: true

Rails.application.routes.draw do
  get 'home/index', to: 'home#index'
  get 'friends', to: 'friends#index'

  resources :friends
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    omniauth_callbacks: 'omni_auth'
  }
  devise_scope :user do
    get 'login', to: 'users/sessions#new'
    get 'signup', to: 'users/registrations#new'
    get 'forgot_password', to: 'users/passwords#new'
    get 'reset_password', to: 'users/passwords#edit'
  end

  root to: 'home#index'
end
