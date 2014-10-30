Rails.application.routes.draw do


  # devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :sessions => "users/sessions" }
  # resources :users, :only => [:index]

  # resources :tracks, only: [:index] do
  #   collection do
  #     get "/topcharts", to: "tracks#topcharts"
  #     get "/random", to: "tracks#random"
  #   end
  # end

  # resources :tags, only: [:index] do
  #   collection do
  #     get "/tracks", to: "tags#tracks"
  #   end
  # end

  # resources :playlists, only: [:index, :create, :show] do
  #   collection do
  #     post "/add", to: "playlists#create_track"
  #   end
  # end

  root to: 'pages#index', id: 'home'


end
