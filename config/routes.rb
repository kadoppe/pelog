Pelog::Application.routes.draw do
  root to: 'articles#index'
  get '/:year/:month/:day/:slug', to: 'articles#show', as: 'article'

  get '/feed', to: 'articles#feed'
  get '/rss', to: redirect('/feed')
end
