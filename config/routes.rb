Rails.application.routes.draw do

  resources :genres
  resources :events
  resources :purposes
  resources :scores
  resources :times
  resources :studies

  devise_for :users
  devise_for :admins

  namespace :admin do
    resources :eventts
    resources :studies
    resources :users
    resources :purposes
  end
  root to: 'studies#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
