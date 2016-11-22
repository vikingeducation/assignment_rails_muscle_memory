Rails.application.routes.draw do
  resources :schmarticles
  root 'articles#new'

  resources :articles
end
