require 'spec_helper'

describe 'Articles' do
  describe 'GET /' do
    subject { get root_path }
    specify { subject and expect(response.status).to eq(200) }
  end

  describe 'GET /articles/YYYY/mm/slug.html' do
    let (:article) { FactoryGirl.create :article }
    subject { get article_path(permalink: article.permalink) }
    specify { subject and expect(response.status).to eq(200) }
  end
end
