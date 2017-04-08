Rails.application.routes.draw do
  root 'sessions#new'

  devise_for :users, controllers: { omniauth_callbacks: "callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :sessions
end
