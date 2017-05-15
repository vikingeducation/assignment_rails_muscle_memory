Rails.application.routes.draw do
  get 'articles/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'articles#new'
resources :articles, :only => [:new, :show, :create, :index]
# get '/articles/:id' => 'articles#show'
# post '/article/new' => 'articles#new'
# post '/article' => 'articles#create'
end
