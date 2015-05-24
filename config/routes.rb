Rails.application.routes.draw do
  root 'articles#index'
  # Thank you! http://stackoverflow.com/questions/6082929/limit-resources-actions
  resources :articles, :only => [:index, :show, :new, :create]
end
