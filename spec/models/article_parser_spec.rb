require 'spec_helper'
describe ArticleParser do
  let (:file_path) do
    "#{Rails.root}/spec/articles/2014-01-19-slug.md"
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
    its([:snippet]) { should eq('Test Snippet') }

    context 'when article have no front matter' do
      let (:file_path) { "#{Rails.root}/spec/articles/2014-01-20-no-front-matter.md" }
      it { should be_nil }
    end
  end
end
