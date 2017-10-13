Rails.application.routes.draw do

  resources :audit_logs, except: [:new, :edit, :destory] do
    member do
      get :confirm
    end
  end

  get 'notifications/create'

  namespace :admin do
    resources :users
    resources :posts
    resources :admin_users

    root to: "users#index"
  end

  resources :posts do
    member do
      get :approve
    end
  end
  get '/count' => "posts#count"
  devise_for :users, skip: [:registeration]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'static#homepage'
end
