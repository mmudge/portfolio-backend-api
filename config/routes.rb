Rails.application.routes.draw do
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

  resources :posts
end
