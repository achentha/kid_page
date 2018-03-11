Rails.application.routes.draw do
  root 'users#index'

  get '/users', to: 'users#index', as: 'users'
  get '/users/new', to: 'users#new', as:'new_user'
  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show', as: 'user'
  get '/users/:id/edit', to: 'users#edit'
  put '/users/:id', to: 'users#update'
  delete '/users/:id', to: 'users#destroy'
  post '/users/:id/todo_container/set_display_completed', to: 'users#set_display_completed'
  post '/users/:id/todo_container/clear_display_completed', to: 'users#clear_display_completed'

  get '/login', to: 'sessions#new', as: 'login'
  get '/logout', to: 'sessions#destroy'
  post '/sessions', to: 'sessions#create'

  get '/users/:id/todos', to: 'todo_items#index', as: 'todos'
  get '/users/:id/todos/new', to: 'todo_items#new', as: 'new_todo'
  post '/users/:id/todos', to: 'todo_items#create'
  get '/users/:id/todos/:todo_id/edit', to: 'todo_items#edit'
  put '/users/:id/todos/:todo_id', to: 'todo_items#update'
  delete '/users/:id/todos/:todo_id', to: 'todo_items#destroy'

  post '/users/:id/todos/:todo_id/set_complete', to: 'todo_items#set_complete'
  post '/users/:id/todos/:todo_id/clear_complete', to: 'todo_items#clear_complete'

end
