Rails.application.routes.draw do
  root to: 'uploads#index'

  resources :uploads, only: [:index, :create]
end
