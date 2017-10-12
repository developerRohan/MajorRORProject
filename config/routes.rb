Rails.application.routes.draw do

  resources :audit_logs
  get 'notifications/create'

  namespace :admin do
    resources :users
    resources :posts
    resources :admin_users

    root to: "users#index"
  end

  resources :posts
  devise_for :users, skip: [:registeration]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'static#homepage'
end
