Rails.application.routes.draw do
  root to: 'articles#new'
  # root "articles#new"
  resources :articles, :only => [:new, :create, :show]
end
