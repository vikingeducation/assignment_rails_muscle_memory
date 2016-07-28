Rails.application.routes.draw do
  root to: 'articles#index'
  resources :articles, except: [:edit, :update, :destroy]

end
