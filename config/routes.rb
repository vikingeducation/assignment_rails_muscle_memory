Rails.application.routes.draw do
  get 'articles/new'

  root 'articles#new'

  resources :articles, only: [:new, :create, :show, :index]
end
