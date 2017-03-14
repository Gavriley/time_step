Rails.application.routes.draw do
  root 'home#index'

  devise_for :users

  resources :records, only: [:index, :create, :update]
  resources :teams, only: [:index]
end
