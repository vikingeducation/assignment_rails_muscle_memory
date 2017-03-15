Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "articles#new"

  get "/articles" => "articles#index"
  get "/articles/:id" => "articles#show"

  get "/articles/new" => "articles#new"
  post "/articles" => "articles#create"
    # shouldn't it be: 
    # post "/article/:id" => "articles#create" ?


# resources :articles

end

# shouldn't it be singular ie "article" ?