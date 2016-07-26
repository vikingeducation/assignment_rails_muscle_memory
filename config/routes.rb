Rails.application.routes.draw do
  root to: 'articles#index'
  get 'new' => 'articles#new'
end
