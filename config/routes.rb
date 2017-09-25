Rails.application.routes.draw do
  get 'articles/new'

  root 'articles#new'
  
  resources :articles, only: [:new]
end
