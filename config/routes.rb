Rails.application.routes.draw do
  root 'records#home'

  devise_for :users

  resources :records
  resources :teams

end
