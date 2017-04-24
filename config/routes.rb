Rails.application.routes.draw do
  root :to => "articles#new"
  resources :articles, :only => [:new, :show, :index, :create, :edit, :update, :destroy]
end
