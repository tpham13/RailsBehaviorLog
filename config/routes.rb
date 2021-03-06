Rails.application.routes.draw do
  #root route 
  root 'sessions#home'
  #add custom routes on top here as needed
  get'/signup' => 'users#new'
  post '/signup' => 'users#create'
  #login route
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  #omniauth callback route
  get '/auth/facebook/callback' => 'sessions#facebook'
  #logout route
  delete '/logout' => 'sessions#destroy'
 

  resources :behavior_logs
  resources :kids do 
    resources :behavior_logs 
  end
  resources :users do 
    resources :behavior_logs 
  end 
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
