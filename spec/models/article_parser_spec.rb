require 'spec_helper'
describe ArticleParser do
  let (:file_path) do
    "#{Rails.root}/spec/articles/2014-01-19-slug.md"
  end

  describe '.sync' do
    before do
      @article = FactoryGirl.create :article
      ArticleParser.sync
    end

    it 'syncs articles table with markdown files' do
      expect(Article.all).not_to be_empty
    end

    it 'deletes article which not has markdown file' do
      expect { Article.find(@article.id) }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  describe '.file_paths' do
    subject { ArticleParser.file_paths }
    it { should_not be_empty }
  end

  describe '.extract_meta_data' do
    subject { ArticleParser.extract_meta_data(file_path) }
    its([:published_at]) { should eq(Date::new(2014, 1, 19)) }
    its([:slug]) { should eq('slug') }
  end

  describe '.extract_body' do
    subject { ArticleParser.extract_body(file_path) }
    it { should match(/<h2>/) }
  end

  describe '.extract_front_matter' do
    subject { ArticleParser.extract_front_matter(file_path) }
    its([:title]) { should eq('Test Title') }
    its([:permalink]) { should eq('Test/Permalink') }

    context 'when article have no front matter' do
      let (:file_path) { "#{Rails.root}/spec/articles/2014-01-20-no-front-matter.md" }
      it { should be_nil }
    end
  end
end