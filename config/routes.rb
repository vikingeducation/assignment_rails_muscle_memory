Rails.application.routes.draw do 

  resources :articles, :only => [:show, :index, :new, :create, :edit, :update]

  root to: 'articles#new'

  # get   '/articles'     => 'articles#index'
  # get   '/articles/:id' => 'articles#show'
  # get   '/articles/new' => 'articles#new'
  # post  '/articles'     => 'articles#create'
  
end
