Rails.application.routes.draw do
  resources :categories, only: [:index, :show]
  resources :comments, only: [:show, :create, :delete]
  resources :users, only: [:show, :create, :delete]
  resources :blogs, only: [:index, :show, :create, :update, :delete]
  # config/routes.rb
  resources :sessions, only: [:is_logged_in?, :create, :destroy]
  get '/login', to: 'sessions#is_logged_in?'
  delete "/logout", to: "sessions#destroy"
  post "/login", to: 'sessions#create'
  post '/create-account', to: 'users#create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
