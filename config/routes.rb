Rails.application.routes.draw do
  root 'welcome#index'
  resources :users do
    resources :exhibits
    member do
      get :dashboard
    end
  end
  resources :comments
  resources :messages
  resources :chatrooms

  get '/admin', to: 'admin/dashboard#index'
  namespace :admin do
    resources :users
    resources :notifications
  end
end
