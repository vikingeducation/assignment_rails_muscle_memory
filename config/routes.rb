Rails.application.routes.draw do
  resources :schmarticles
  root to: 'articles#index'
  resources :articles
end
