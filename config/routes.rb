Rails.application.routes.draw do

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
  # resources :comments
  post 'posts/:post_id/comments', to: "comments#create"
  get 'posts/:post_id/comments', to: "comments#index"

  get 'current_user', to: 'users#current'
  root to: 'registrations#signup'
end
