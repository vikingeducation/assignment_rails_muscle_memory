Rails.application.routes.draw do

  root to: "articles#new"

  resources :articles, :except => [:update, :destroy, :edit]

  #get '/articles/new' => "articles#new"
  #post '/articles/:id' => "articles#create"
  #get '/articles/:id' => "articles#show" #BUT WHYD OEES THIS NOT FUSFJSLJWER WORK?!@!?@??! (prefix article_path doesn't show up)

end
