Todone::Application.routes.draw do
  post "receive_sms" => "twilio#sms"
  resources :tasks
  root to: 'tasks#index'
end
