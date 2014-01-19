require 'spec_helper'

describe Article do
  let(:file_name) { '2014-01-01-test.md' }
  let(:article) { Article.new(file_name) }

  describe '.new' do
    subject { article }
    its(:file_name) { should eq(file_name) }
  end

  describe '#id' do
    subject { article.id }
    it { should eq(file_name) }
  end
end
