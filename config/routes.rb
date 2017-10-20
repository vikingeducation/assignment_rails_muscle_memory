Rails.application.routes.draw do
  resources :schmarticles
  root 'articles#index'
  resources :articles
end
