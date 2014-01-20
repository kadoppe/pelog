require 'spec_helper'

describe Article do
  let (:article) { FactoryGirl.create(:article) }
  let (:file_path) do
    "#{Rails.root}/spec/articles/2014-01-19-slug.md"
  end

  describe '.sync' do
    before do
      @article = FactoryGirl.create :article
      Article.sync
    end

    it 'syncs articles table with markdown files' do
      expect(Article.all).not_to be_empty
    end

    it 'deletes article which not has markdown file' do
      expect { Article.find(@article.id) }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  describe '.file_paths' do
    subject { Article.file_paths }
    it { should_not be_empty }
  end

  describe '.extract_meta_data' do
    subject { Article.extract_meta_data(file_path) }
    its([:published_at]) { should eq(Date::new(2014, 1, 19)) }
    its([:slug]) { should eq('slug') }
  end

  describe '.extract_body' do
    subject { Article.extract_body(file_path) }
    it { should match(/<h2>/) }
  end

  describe '.extract_front_matter' do
    subject { Article.extract_front_matter(file_path) }
    its([:title]) { should eq('Test Title') }

    context 'when article have no front matter' do
      let (:file_path) { "#{Rails.root}/spec/articles/2014-01-20-no-front-matter.md" }
      it { should be_nil }
    end
  end
end
