Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'oauth_callbacks' }

  get 'user_properties' => 'users#index', as: 'user_properties'
  resources :properties

  root to: 'properties#index'
end
