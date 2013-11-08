Todone::Application.routes.draw do
  
  get "login" => "sessions#new", as: "login"
  post "login" => "sessions#create"
  get "logout" => "sessions#destroy", as: "logout"

  post "sms_receive" => "twilio#sms"

  resources :users
  resources :tasks
  root to: "sessions#new"
end
