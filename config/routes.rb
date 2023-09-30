Rails.application.routes.draw do
  root "subjects#index"
  resources :subjects, path: 'threads', only: [:index, :show] do
    resources :posts
  end
  
  post 'login', to: 'logins#create'
  get 'login', to: 'logins#new'
end
