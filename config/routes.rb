Rails.application.routes.draw do
  resources :behavior_logs
  resources :users
  resources :kids
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
