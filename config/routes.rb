Rails.application.routes.draw do
  get 'home/index'
  get 'home/ranking'
  resources :comparation, only: [:index]
  resources :ranking, only: [:index]
  resources :politicians, only: [:index]

  root to: 'home#index'
end
