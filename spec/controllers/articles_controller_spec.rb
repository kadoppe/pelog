require 'spec_helper'

describe ArticlesController do
  let (:articles) { [mock_model(Article)] }

  describe 'GET index' do
    subject { get :index }
    before { Article.stub(:all).and_return(articles) }
    specify { subject and expect(assigns[:articles]).to eq(articles) }
  end
end
