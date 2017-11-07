Rails.application.routes.draw do

  root to: 'articles#new'

  resources :articles, only: [ :new, :index, :create, :show ]

end
