# config/routes.rb
Rails.application.routes.draw do
  root 'events#index'
  devise_for :users
  get 'events/new', to: 'events#new'
  get 'events/showAll', to: 'events#showAll'

  namespace :admin do
    root 'dashboard#index'
    resources :users do
      member do
        patch 'promote_to_admin'
      end
    end
    resources :event_submissions, only: [:index, :show, :edit, :update]
    resources :events, only: [:new, :create]
  end
  # Route pour le profil de l'utilisateur connecté
  get 'profile', to: 'users#profile', as: 'user_profile'

  resources :events, only: [:index, :new, :show, :create]
  resources :users, only: [:show]
end
