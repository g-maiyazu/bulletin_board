Rails.application.routes.draw do
  root 'static_pages#home'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
  }

  devise_scope :user do
    get "signup", to: "users/registrations#new"
    post "signup", to: "users/registrations#create"
    get "edit_user", to: "users/registrations#edit"
    patch "update_user", to: "users/registrations#update"
    get "login", to: "users/sessions#new"
    post "login", to: "users/sessions#create"
    delete "logout", to: "users/sessions#destroy"
  end

  resources :users, only: [:index, :show]

  resources :posts, except: [:index] do
    resources :comments, only: [:create, :destroy]
  end
end
