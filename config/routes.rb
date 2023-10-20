Rails.application.routes.draw do
  root "subjects#index"
  resources :subjects, path: 'threads', only: [:index, :show] do
    resources :posts, only: :create
  end

  resources :posts do
    resources :comments, only: :create
  end
  
  post 'login', to: 'logins#create'
  get 'login', to: 'logins#new'

  post 'signup', to: 'signups#create'
  get 'signup', to: 'signups#new'
end
