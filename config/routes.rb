Rails.application.routes.draw do
  root 'home#index'
  get '/users', to: 'users#index', as: 'users'
  get '/users/new', to: 'users#new', as:'new_user'
  post '/users', to: 'users#create'
  get '/users/:user_name', to: 'users#show', as: 'user'
  get '/users/:user_name/edit', to: 'users#edit'
  patch '/users/:user_name', to: 'users#update'
  delete '/users/:user_name', to: 'users#destroy'
end
