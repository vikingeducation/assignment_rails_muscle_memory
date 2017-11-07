Rails.application.routes.draw do

  root to: 'articles#new'

  resources :schmarticles
  resources :articles, only: [ :new, :index, :create, :show, :edit, :update, :destroy ]

end
