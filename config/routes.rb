AssignmentRailsMuscleMemory::Application.routes.draw do
  root to: 'articles#new'
  get 'article/new' => 'articles#new'
end
