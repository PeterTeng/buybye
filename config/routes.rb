MYPAGE_ACTION_ARRAY =
[
  "dashboard",
  "notification",
  "to_do_list",
  "favorite_list",
  "ex_exhibiting",
  "ex_trading",
  "ex_settle",
  "pur_trading",
  "pur_past_trade",
  "reviews",
  "profile",
  "mail_password",
  "logout"
 ]

Rails.application.routes.draw do
  root 'welcome#index'
  resources :users do
    resources :exhibits
    member do
      get :dashboard
    end
  end

  mount ActionCable.server => '/cable'

  resources :comments
  resources :messages
  resources :chatrooms
  resources :items

  #mypage actions
  MYPAGE_ACTION_ARRAY.each do |action_name|
    get "mypage/#{action_name}" => "mypage#{action_name}"
  end


  # for login&out
  get 'login' => 'session#new'
  post 'login' => 'session#create'
  delete 'logout' => 'session#destroy'

  get '/admin', to: 'admin/dashboard#index'
  namespace :admin do
    resources :users
    resources :notifications
  end
end
