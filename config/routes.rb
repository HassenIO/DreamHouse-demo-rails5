Rails.application.routes.draw do
  devise_for :users

  get 'user_properties' => 'users#index', as: 'user_properties'
  resources :properties

  root to: 'properties#index'
end
