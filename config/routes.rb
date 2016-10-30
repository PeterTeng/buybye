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
  "logout",
  "inquiry"
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
  resources :chat_rooms
  resources :items do
    member do
      put :report
      post :purchase
    end
    collection do
      get :report_succeeded
    end
  end
  resources :inquiries

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
    resources :inquiries do
      member do
        put :acknowledged
      end
    end
    resources :items do
      member do
        post :warning
        put :unreported
      end
    end
    resources :users
    resources :notifications
    resources :black_lists
  end
end
