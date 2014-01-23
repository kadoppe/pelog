require 'spec_helper'

describe 'Articles' do
  describe 'GET /' do
    subject { get root_path }
    specify { subject and expect(response.status).to eq(200) }
  end

  describe 'GET /:year/:month/:day.html' do
    let (:article) { FactoryGirl.create :article }
    subject do
      published_at = article.published_at
      get "/#{published_at.year}/#{published_at.month}/#{published_at.day}/#{article.slug}.html"
    end
    specify { subject and expect(response.status).to eq(200) }
  end
end
