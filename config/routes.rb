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


  resources :users, only: [:index, :show] do
    resources :messages
    get 'received_messages', to: 'messages#received_messages'
    get 'sent_messages', to: 'messages#sent_messages'
  end

  resources :posts

  put 'posts/:id', to: "posts#update"
  # resources :comments
  post 'posts/:post_id/comments', to: "comments#create"
  get 'posts/:post_id/comments', to: "comments#index"

  get 'current_user', to: 'users#current'

end
