Rails.application.routes.draw do
  root 'users#index'
  resources :feeds do
    collection do
      post 'confirm'
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
end
