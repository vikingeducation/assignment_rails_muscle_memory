Rails.application.routes.draw do
  root to: 'articles#index'
  resources :articles, :except => [:update, :destroy, :create]


  
  # get 'new' => 'articles#new'
  # post 'articles/new' =>  'articles#create'
  # get 'articles/:id' => 'articles#show', as: 'article'

end
