require 'spec_helper'

describe Article do
  let (:article) { FactoryGirl.create(:article) }

  describe '.find' do
    subject { Article.find(article.file_name) }
    it { should eq(article) }
  end
end
