Rails.application.routes.draw do
  # get 'users/show'
  get 'users/top'
  # get 'books/top'

  devise_for :users
  resources :users, only: [:show, :edit, :update, :index] 
  resources :books


  root 'users#top'
  get '/about' => 'users#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
