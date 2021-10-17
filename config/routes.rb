Rails.application.routes.draw do
resources :books
resources :lines
resources :notes

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :create]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
    end
  end
end