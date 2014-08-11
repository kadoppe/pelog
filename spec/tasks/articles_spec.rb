require 'spec_helper'

describe 'articles:sync' do
  include_context 'rake'

  let(:parser) { double() }
  before { allow(ArticleParser).to receive(:new).and_return(parser) }

  its(:prerequisites) { should include('environment') }

  it 'sync the report' do
    expect(parser).to receive(:sync)
    subject.invoke
  end
end
