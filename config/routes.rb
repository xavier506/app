Rails.application.routes.draw do

  root 'orders#index'

  devise_for :users, :path_prefix => 'd' # routes for devise modules on User
  resources :users
  resources :clients
  resources :orders
  resources :notifications
  resources :certificates
  resources :farms

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
