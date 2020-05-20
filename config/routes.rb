Rails.application.routes.draw do
  namespace :web do
    get 'developers/new'
  end

  namespace :admin do
    resources :users
  end
  
  namespace :api do
    namespace :v1 do
      resources :tasks, only: [:index, :show, :create, :update, :destroy]
    end
  end
  
  root :to => "web/boards#show"

  scope module: :web do
    resource :board, only: :show
    resource :session, only: [:new, :create, :destroy]
    resources :developers, only: [:new, :create]
  end
end