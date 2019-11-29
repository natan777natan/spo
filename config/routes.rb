Rails.application.routes.draw do
  root 'map#index'
  get 'relationships/create'
  get 'relationships/destroy'
  devise_for :users
  get 'users/spotify_login', to: 'users#spotify_login', as: 'spotify_login'
  resources :users, only: [:show, :index, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end
  resources :music, only: [:index]
  resources :map, only: [:index]
  get '/map_request', to: 'map#map', as: 'map_request'
  get '/music/:travel_time/index', to: 'music#index', as: 'music_request'
  get '/music/about', to: 'music#about', as: 'music_about'
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
