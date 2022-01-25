Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'home/index'
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy'

  get '/url', to: 'url#index', as: 'url'    # lists all user's urls
  get '/new', to: 'url#new'                 # form to create new urls
  get '/url/:name', to: 'url#show'          # show datailed url with :name
  post '/url', to: 'url#create', as: 'urls' # path to send the post of the new url
  delete '/url/:name', to: 'url#destroy'    # delete url with this :id

  resources :users, only: [:new, :create, :update, :destroy]

  get '/:name', to: 'home#redirect'

  # Defines the root path route ("/")
  root 'home#index'
end
