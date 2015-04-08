GifVault::Application.routes.draw do

  get 'developers/home'

  resources :ideas

  #root to: 'gif#cool'
  root to: 'ideas#index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/cool' => 'gif#cool'  
  get '/sweet' => 'gif#sweet'
  
  get '/ideas' => 'ideas#new'
  post '/ideas' => 'ideas#create'
  get '/ideas' => 'ideas#destroy'  
  
end