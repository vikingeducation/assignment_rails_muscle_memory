Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to => "articles#new"

  # resources :articles, only: [:index, :show, :new, :create, :edit]
  resources :articles, except: [:destroy]
end
