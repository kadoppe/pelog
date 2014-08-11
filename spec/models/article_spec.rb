require 'spec_helper'

describe Article, :type => :model do
  let (:article) { FactoryGirl.create(:article) }

  describe 'default scope' do
    let(:article_one) { FactoryGirl.create(:article, published_at: Date::new(2011, 1, 1)) }
    let(:article_two) { FactoryGirl.create(:article, published_at: Date::new(2013, 1, 1)) }

    it 'orders by descending published_at' do
      expect(Article.all).to eq([article_two, article_one])
    end
  end

  describe '#github_url' do
    subject { article.github_url }
    it { is_expected.to eq 'https://github.com/kadoppe/pelog/tree/master/app/articles/2014-01-01-test.html' }
  end
end
