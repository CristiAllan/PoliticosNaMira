Rails.application.routes.draw do
  get 'pages/index'
  resources :pages, only: [:index]
  resources :ranking, only: [:index]
  
  root to: 'pages#index'
end
