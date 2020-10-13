Rails.application.routes.draw do
  #add custom routes on top here as needed
  get'/signup' => 'users#new'
  post '/signup' => 'users#create'
  resources :behavior_logs
  resources :users
  resources :kids
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
