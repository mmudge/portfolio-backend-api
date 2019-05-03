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
    resources :post
  end

  resources :post, only: [:index, :show]

  root to: 'registrations#signup'
end
