Rails.application.routes.draw do
resources :books
get '/getbookbg', to: 'books#getbookbg'
resources :lines
resources :flashcards
get '/linebybook/:id', to: 'lines#booklines'
resources :notes

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :create]
      post '/autologin', to: 'auth#autologin'
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
    end
  end
end