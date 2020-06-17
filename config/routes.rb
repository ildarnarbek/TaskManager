Rails.application.routes.draw do
  namespace :web do
    get 'password_resets/new'
  end
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  namespace :web do
    get 'developers/new'
  end

  namespace :admin do
    resources :users
  end
  
  namespace :api do
    namespace :v1 do
      resources :tasks, only: [:index, :show, :create, :update, :destroy]
      resources :users, only: [:index, :show]
    end
  end
    
  root :to => "web/boards#show"

  scope module: :web do
    resource :board, only: :show
    resource :session, only: [:new, :create, :destroy]
    resources :developers, only: [:new, :create]
    resources :password_reset, only: [:new, :create, :edit, :update]
  end
end