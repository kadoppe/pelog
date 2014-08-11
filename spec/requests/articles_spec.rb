require 'spec_helper'

describe 'Articles', :type => :request do
  let (:article) { FactoryGirl.create :article }

  describe 'GET /' do
    subject { get root_path }
    specify { subject and expect(response.status).to eq(200) }
  end

  describe 'GET /:year/:month/:day.html' do
    subject { get "/2014/01/01/#{article.slug}.html" }
    specify { subject and expect(response.status).to eq(200) }
  end

  describe 'GET /feed' do
    subject { get '/feed' }
    before { article }
    specify { subject and expect(response.status).to eq(200) }
  end
end
