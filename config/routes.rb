Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]

  resources :events, only: [:new, :create, :index, :show]
  root to: 'events#index'
end
