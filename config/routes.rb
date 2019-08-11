Rails.application.routes.draw do
  resources :comparation, only: [:index]
  resources :ranking, only: [:index]
  resources :politicians, only: [:index]

  root to: 'comparation#index'
end
