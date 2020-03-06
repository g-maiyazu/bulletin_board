Rails.application.routes.draw do
  root 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/tos', to: 'static_pages#tos'

  devise_for :users
end
