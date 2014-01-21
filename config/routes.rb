Pelog::Application.routes.draw do
  root to: 'articles#index'
  get 'articles/*permalink', to: 'articles#show', as: 'article'
end
