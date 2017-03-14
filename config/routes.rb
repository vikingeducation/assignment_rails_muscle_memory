Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  get "/posts" => "posts#index"
  get "/posts" => "posts#new"
  get "/posts/new" => "posts#create"

end
