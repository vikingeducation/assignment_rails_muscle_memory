Rails.application.routes.draw do
  resources :schmarticles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'articles#index'
  resources :articles, only: [:create, :destroy, :edit, :index, :new, :update, :show]
end
