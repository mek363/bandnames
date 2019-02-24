Rails.application.routes.draw do

  get    '/idea',    to: 'bandnames#new'
  post   '/idea',    to: 'bandnames#create'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get  '/home',   to: 'main#home'
  get  '/signup',  to: 'users#new'

  root 'main#home'

  resources :users
  resources :bandnames,   only: [:new, :create, :show]
end
