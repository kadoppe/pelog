require 'spec_helper'

describe Article do
  let (:article) { FactoryGirl.create(:article) }
  let (:file_path) { "#{Rails.root}/spec/articles/2014-01-19-slug.md" }

  describe '.sync' do
    before { Article.sync }

    it 'sync articles table with markdown files' do
      Article.all.should_not be_empty
    end
  end

  describe '.file_paths' do
    subject { Article.file_paths }
    it { should_not be_empty }
  end

  describe '.extract_meta_data' do
    subject { Article.extract_meta_data(file_path) }
    its([:published_year]) { should eq(2014) }
    its([:published_month]) { should eq(1) }
    its([:published_date]) { should eq(19) }
    its([:slug]) { should eq('slug') }
  end

  describe '.extract_body' do
    subject { Article.extract_body(file_path) }
    it { should match(/<h2>/) }
  end
end
