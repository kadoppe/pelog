require 'spec_helper'

describe ApplicationHelper do

  describe '#article_permalink' do
    let (:article) { FactoryGirl.build :article }
    subject { helper.article_permalink(article) }
    it { should eq("/2014/01/01/#{article.slug}.html") }
  end

end
