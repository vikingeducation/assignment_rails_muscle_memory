Rails.application.routes.draw do

  root to: "articles#new"

  resources :articles
end


