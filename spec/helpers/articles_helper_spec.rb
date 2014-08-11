require 'spec_helper'

describe ArticlesHelper, :type => :helper do

  describe '#article_permalink' do
    let (:article) { FactoryGirl.build :article }
    subject { helper.article_permalink(article) }
    it { is_expected.to eq("/2014/01/01/#{article.slug}.html") }

    context 'when absolute path is required' do
      subject { helper.article_permalink(article, true) }
      it { is_expected.to eq("http://test.host/2014/01/01/#{article.slug}.html") }
    end
  end

end
