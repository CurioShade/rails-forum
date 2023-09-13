Rails.application.routes.draw do
  root "subjects#index"

  resources :subjects, path: 'threads', only: [:index, :show]
end
