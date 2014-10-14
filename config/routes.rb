Rails.application.routes.draw do


  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users, :only => [:index, :destroy]

  resources :tracks, only: [:index] do
    collection do
      get "/topcharts", to: "tracks#topcharts"
    end
  end

  root to: 'pages#index', id: 'home'


end
