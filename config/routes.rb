AssignmentRailsMuscleMemory::Application.routes.draw do
  root to: 'articles#new'
  resources :articles, :only => [:new, :create, :show, :index, :edit, :update]
end
