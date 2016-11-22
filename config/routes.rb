Rails.application.routes.draw do
  root :to => "articles#new"
  resources :articles, :only => [:new, :create, :show, :index]
end
