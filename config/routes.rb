Rails.application.routes.draw do

  post 'rides/new' => "rides#new"

  root 'static_pages#home'

  get '/signin' => "sessions#new"
  post '/sessions' => "sessions#create"
  delete '/logout' => "sessions#destroy"

  resources :attractions

  resources :users

end