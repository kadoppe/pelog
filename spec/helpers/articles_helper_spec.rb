require 'spec_helper'

describe ArticlesHelper do

  describe '#article_permalink' do
    let (:article) { FactoryGirl.build :article }
    subject { helper.article_permalink(article) }
    it { should eq("/2014/01/01/#{article.slug}.html") }

    context 'when absolute path is required' do
      subject { helper.article_permalink(article, true) }
      it { should eq("http://test.host/2014/01/01/#{article.slug}.html") }
    end
  end

end
