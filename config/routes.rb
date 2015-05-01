Rails.application.routes.draw do
  root to: 'articles#index'
  resource :article
end
