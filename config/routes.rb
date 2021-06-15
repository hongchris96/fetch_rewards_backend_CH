Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'

  resources :users, only: [:index, :show, :create, :update, :new]
  resources :transactions, only: [:index, :create, :new]
  resources :spends, only: [:create]
end
