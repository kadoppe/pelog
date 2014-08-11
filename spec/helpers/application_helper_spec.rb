require 'spec_helper'

describe ApplicationHelper, :type => :helper do
  describe '#blog_title' do
    subject { helper.blog_title }
    it { is_expected.to eq('pe::log') }

    context 'for article page' do
      let (:article) { FactoryGirl.build :article }
      subject { helper.blog_title(article) }
      it { is_expected.to eq("#{article.title} | pe::log") }
    end
  end

  describe '#blog_description' do
    context 'for article page' do
      let (:article) { FactoryGirl.build :article }
      subject { helper.blog_description(article) }
      it { is_expected.to eq(article.snippet) }
    end
  end

  describe '#caninocal_url' do
    subject { helper.canonical_url }
    it { is_expected.to eq('http://test.host/') }

    context 'for article page' do
      let (:article) { FactoryGirl.build :article }
      subject { helper.canonical_url(article) }
      it { is_expected.to eq("http://test.host/2014/01/01/#{article.slug}.html") }
    end
  end
end
