AssignmentRailsMuscleMemory::Application.routes.draw do
  root to: 'articles#new'
  get  'articles/new' => 'articles#new'
  post 'articles/new' => 'articles#create'
end
