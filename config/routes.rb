Pelog::Application.routes.draw do
  root to: 'articles#index'

  scope format: true, constraints: { format: 'html' } do
    get '/:year/:month/:day/:slug',
      to: 'articles#show',
      as: 'article',
      constraints: {
        year: /\d{4}/,
        month: /\d{2}/,
        day: /\d{2}/,
      }
  end

  get '/feed', to: 'articles#feed'
  get '/rss', to: redirect('/feed')
  get '/sitemap', to: redirect("http://#{ENV['FOG_DIRECTORY']}.s3.amazonaws.com/sitemaps/sitemap.xml.gz")

  get '*not_found' => 'application#render_404'
end
