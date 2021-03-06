Rails.application.routes.draw do
  get 'pexel_photos_controller/index'
  root to: 'pages#index'

  devise_for :users,
             path: '',
             path_names: {
               sign_in: 'login',
               sign_out: 'logout',
               registration: 'signup'
             },
             controllers: {
               sessions: 'sessions',
               registrations: 'registrations'
             }

  get 'current_user', to: 'users#current'

  get 'projects/:id', to: 'projects#show'
  put 'projects/:id', to: 'projects#update'
  delete 'projects/:id', to: 'projects#destroy'
  get 'projects', to: 'projects#index'
  post 'projects', to: 'projects#create'

  put 'technologies/:id', to: 'technologies#update'
  delete 'technologies/:id', to: 'technologies#destroy'
  get 'technologies', to: 'technologies#index'
  post 'technologies', to: 'technologies#create'

  post 'messages', to: 'messages#create'
  get 'messages', to: 'messages#index'

  get 'project_photos', to: 'pexel_photos#index'

  resources :posts
end
