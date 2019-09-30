Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show, :destroy]

  get 'signin', to: 'users#signin'
  post 'login', to: 'users#login'


  resources :events, only: [:new, :create, :index, :show] do
    member do
      get :attend
    end
  end
  
  root to: 'events#index'
end
