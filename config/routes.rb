Rails.application.routes.draw do
  get 'topics/new'
  get 'sessions/new'
  get 'users/new'
  root 'pages#index'
  get 'pages/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  
  get "/login", to: "sessions#new"
  post "/login", to:"sessions#create"
  delete "/logout", to: "sessions#destroy"
  
  resources :users
  resources :topics
  
  get "favorites/index"
  post "/favorites", to: "favorites#create"
  delete "/favorites", to: "favorites#create"
  
  resources :topics do
    resources :comments, only: [:create]
  end
end
