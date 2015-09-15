Rails.application.routes.draw do
  
  get "/about" => "home#about"
  
  # CRUD for post
  resources :posts do
    resources :comments,   only: [:create, :destroy]
    resources :favourites, only: [:create, :destroy]
    resources :votes,      only: [:create, :destroy, :update ]
  end
  
  resources :users, only: [:new, :create] do
    collection do
      get :edit
      patch :update
    end
    # resources :favourites, only: [:index]
  end
  
  resources :sessions, only: [:new, :create] do
    # this will crete for us a route with DELETE http verb and /sessions
    # adding the on: :collection option will make it part of the routes for 
    # sessions, which means it won't prepend the routes with /sessions/:session_id
    delete :destroy, on: :collection
  end
  
  root "home#home"

end
