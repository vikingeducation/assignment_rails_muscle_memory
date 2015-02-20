Rails.application.routes.draw do
  root :to => "articles#new"
  get '/articles/new' => 'articles#new'
end
