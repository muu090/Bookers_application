Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, controllers: {   
    registrations: 'users/registrations',
    sessions: 'users/sessions' }
  resources :users, only: [:show, :index, :edit, :update]
  resources :books, only: [:new, :index, :show, :create, :edit, :update, :destroy]
  
  # get 'home', to: 'books#home', as: 'home'
  root 'books#home'
  get 'home/about', to: 'books#about', as: 'about'
  
end
