Rails.application.routes.draw do

  get 'articles/new'

  root :to => 'articles#new'
  get '/new' => 'articles#new'
  post '/create' => 'articles#create'

end
