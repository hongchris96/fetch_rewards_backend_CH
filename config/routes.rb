Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: {format: :json} do
    resources :users, only: [:index, :show, :create, :update, :new]
    resources :transactions, only: [:index, :show, :create, :new]
    resources :spends, only: [:show, :create, :new]
  end
end
