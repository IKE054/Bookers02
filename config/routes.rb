Rails.application.routes.draw do
  # get 'users/show'
  get 'users/top'
  # get 'books/top'

  devise_for :users
  resources :users, only: [:show, :edit, :update, :index] do
  	  resources :books, only: [:create, :destroy]
  	end

  resources :books, only: [:index]

  root 'users#top'
  get '/about' => 'users#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
