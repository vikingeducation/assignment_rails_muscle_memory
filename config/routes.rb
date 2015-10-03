Rails.application.routes.draw do

  resources :articles, only: [ :new, :create ]
  root to: 'articles#new'

end
