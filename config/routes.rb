Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "articles#new"

  get "/article/new" => "articles#new"
  post "/article" => "articles#create"
end

# shouldn't it be singular ie "article" ?