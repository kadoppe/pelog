require 'spec_helper'

describe 'routing to articles' do
  it 'routes /:year/:month/:day/:slug.html to articles#show' do
    expect(get: '/2014/01/01/slug.html').to route_to(
      controller: 'articles',
      action: 'show',
      year: '2014',
      month: '01',
      day: '01',
      slug: 'slug',
      format: 'html'
    )
  end

  it 'routes /feed to articles#feed' do
    expect(get: '/feed').to route_to(controller: 'articles', action: 'feed')
  end
end
