Rails.application.routes.draw do

  root 'static_pages#home'

  get '/login' => "sessions#new"
  post '/sessions' => "sessions#create"
  delete '/logout' => "sessions#destroy"

  resources :attractions

  resources :users

end