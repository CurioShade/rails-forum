Rails.application.routes.draw do
  root "subjects#index"
  resources :subjects, path: 'threads', only: [:index, :show] do
    resources :posts, only: [:create, :destroy]
  end

  resources :posts, only: :show do
    resources :comments, only: [:create, :destroy]
  end

  scope '/admin' do
    resources :categories do
      resources :subjects, path: 'threads', except: [:index, :show]
    end
  end
  
  post 'login', to: 'logins#create'
  get 'login', to: 'logins#new'
  delete 'logout', to: 'logins#destroy'

  post 'signup', to: 'signups#create'
  get 'signup', to: 'signups#new'
end
