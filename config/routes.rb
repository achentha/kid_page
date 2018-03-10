Rails.application.routes.draw do
  root 'users#index'

  get '/users', to: 'users#index', as: 'users'
  get '/users/new', to: 'users#new', as:'new_user'
  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show', as: 'user'
  get '/users/:id/edit', to: 'users#edit'
  patch '/users/:id', to: 'users#update'
  delete '/users/:id', to: 'users#destroy'

  get '/login', to: 'sessions#new', as: 'login'
  get '/logout', to: 'sessions#destroy'
  post '/sessions', to: 'sessions#create'

  get '/users/:id/todos', to: 'todo_items#index', as: 'todos'
  get '/users/:id/todos/new', to: 'todo_items#new', as: 'new_todo'
  post '/users/:id/todos', to: 'todo_items#create'
end
