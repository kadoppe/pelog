require 'spec_helper'

describe ArticlesController do
  let (:article) { mock_model(Article) }
  let (:articles) { [article] }

  describe 'GET index' do
    subject { get :index }
    before { Article.stub(:all).and_return(articles) }
    specify { subject and expect(assigns[:articles]).to eq(articles) }
  end

  describe 'GET show' do
    subject { get :show, year: '2014', month: '01', day: '01', slug: 'slug', format: :html }
    before { Article.stub(:find_by!).and_return(article) }
    specify { subject and expect(assigns[:article]).to eq(article) }
  end

  describe 'GET feed' do
    subject { get :feed }
    before { Article.stub(:all).and_return(articles) }
    specify { subject and expect(assigns[:articles]).to eq(articles) }
  end
end
