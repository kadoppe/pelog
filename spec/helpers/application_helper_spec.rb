require 'spec_helper'

describe ApplicationHelper do
  describe '#blog_title' do
    subject { helper.blog_title }
    it { should eq('pelog') }

    context 'for article page' do
      let (:article) { FactoryGirl.build :article }
      subject { helper.blog_title(article) }
      it { should eq("#{article.title} | pelog") }
    end
  end

  describe '#blog_description' do
    context 'for article page' do
      let (:article) { FactoryGirl.build :article }
      subject { helper.blog_description(article) }
      it { should eq(article.snippet) }
    end
  end
end
