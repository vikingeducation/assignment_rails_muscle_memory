Rails.application.routes.draw do
  root 'articles#new'

  get "/articles" => "articles#new"
end
