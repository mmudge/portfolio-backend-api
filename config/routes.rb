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
  end

  resources :posts


  get 'current_user', to: 'users#current'
  root to: 'registrations#signup'
end
