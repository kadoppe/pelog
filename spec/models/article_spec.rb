require 'spec_helper'

describe Article do
  let (:article) { FactoryGirl.create(:article) }

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

  describe '.parse_file_path' do
    subject { Article.parse_file_path('app/2014-01-19-slug.md') }
    its([:published_year]) { should eq(2014) }
    its([:published_month]) { should eq(1) }
    its([:published_date]) { should eq(19) }
    its([:slug]) { should eq('slug') }
  end
end
