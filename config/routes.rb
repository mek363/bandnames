Rails.application.routes.draw do
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get  '/home',   to: 'main#home'
  get  '/signup',  to: 'users#new'

  root 'main#home'

  resources :users
end
