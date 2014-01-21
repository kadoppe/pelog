require 'spec_helper'

describe 'routing to articles' do
  it 'routes /articles/:permalink to articles#show for permalink' do
    expect(get: '/articles/2014/01/slug.html').to route_to(
      controller: 'articles',
      action: 'show',
      permalink: '2014/01/slug',
      format: 'html'
    )
  end
end
