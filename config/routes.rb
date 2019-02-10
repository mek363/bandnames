Rails.application.routes.draw do
  get  '/home',   to: 'main#home'
  get  '/signup',  to: 'users#new'

  root 'main#home'
end
