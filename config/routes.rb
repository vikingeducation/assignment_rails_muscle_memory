Rails.application.routes.draw do
  # resources :articles
  root to: 'articles#index'
  get 'new' => 'articles#new'

  post 'articles/new' =>  'articles#create'
  get 'articles/:id' => 'articles#show', as: 'article'

end
