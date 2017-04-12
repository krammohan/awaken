Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => "/sidekiq"

  root 'sessions#new'

  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :sessions

  resources :users do
    resources :widgets
  end

  put 'users/:id/weather' => 'users#change_weather', as: "users_weather"
  put 'users/:id/maps' => 'users#change_maps', as: "users_maps"
  get 'devices/connect/:id' => 'devices#connect'

  get 'devices/new' => 'devices#new', as: "new_devices"
  post 'devices/create' => 'devices#create'
end
