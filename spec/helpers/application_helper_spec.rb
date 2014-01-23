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

  describe '#caninocal_url' do
    subject { helper.canonical_url }
    it { should eq('http://test.host/') }

    context 'for article page' do
      let (:article) { FactoryGirl.build :article }
      subject { helper.canonical_url(article) }
      it { should eq("http://test.host/2014/01/01/#{article.slug}.html") }
    end
  end
end
