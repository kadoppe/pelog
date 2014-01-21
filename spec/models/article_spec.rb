require 'spec_helper'

describe Article do
  let (:article) { FactoryGirl.create(:article) }

  describe 'default scope' do
    let(:article_one) { FactoryGirl.create(:article, published_at: Date::new(2011, 1, 1)) }
    let(:article_two) { FactoryGirl.create(:article, published_at: Date::new(2013, 1, 1)) }

    it 'orders by descending published_at' do
      expect(Article.all).to eq([article_two, article_one])
    end
  end
end
