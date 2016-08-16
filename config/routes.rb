Rails.application.routes.draw do
  get 'posts/new'

  post 'posts/new', to: 'posts#create'

  get '/posts', to: 'posts#index'

  get '/login', to: 'sessions#new'

  post '/login', to: 'sessions#create'

  get '/logout', to: 'sessions#delete'

  root 'sessions#new'
  resources :sessions, only: [:new, :create, :destroy]
end
