Rails.application.routes.draw do


  resources :products
  resources :admins, path: "admin"
  resources :users
  resources :sessions
  resources :categories, only: [:index, :show]
  resources :carts

  get '/login'  => 'sessions#new'
  get '/logout'  => 'sessions#destroy'

  get 'checkout' => 'carts#checkout'

  get '/carts/:id' => 'carts#show'
  delete '/carts' => 'carts#delete'

  root 'products#index'

end
