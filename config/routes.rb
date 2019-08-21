Rails.application.routes.draw do

  devise_for :users, :controllers => {
   :registrations => 'users/registrations'
  }

  devise_for :admins

  resources :genres
  resources :events
  resources :purposes
  resources :scores
  resources :post_times
  resources :users
  resources :media
  resources :contacts do
    resources :contact_comments
  end
  resources :studies do
    resources :likes
  end





  namespace :admin do
    resources :events
    resources :studies
    resources :users
    resources :purposes
    resources :genres
    resources :media
    resources :contacts do
      resources :contact_comments
    end
  end
  root to: 'studies#index'
  get 'about' => 'studies#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
