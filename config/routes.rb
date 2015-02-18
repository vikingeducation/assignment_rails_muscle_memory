Rails.application.routes.draw do

  root to: 'articles#index'

  resources :posts, only: [:new, :create, :show, :index]
end
