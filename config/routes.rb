Rails.application.routes.draw do
  # get 'users/show'
  get 'users/top'
  # get 'books/top'

  devise_for :users
  resources :users, only: [:show, :edit, :update, :index] do
  	  resources :books, only: [:show, :create, :destroy]
  	end

  resources :books, only: [:index, :show]

  root 'users#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
