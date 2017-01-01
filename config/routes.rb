Rails.application.routes.draw do

  root to: "articles#new"

  resources :articles

  #get '/articles/new' => "articles#new"
  #post '/articles/:id' => "articles#create"
  #get '/articles/:id' => "articles#show" #BUT WHYD OEES THIS NOT FUSFJSLJWER WORK?!@!?@??!

end
