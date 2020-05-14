Rails.application.routes.draw do
  namespace :web do
    get 'developers/new'
  end
  root :to => "web/boards#show"

  scope module: :web do
    resource :board, only: :show
    resource :session, only: [:new, :create, :destroy]
    resources :developers, only: [:new, :create]
  end
end