require 'spec_helper'

describe 'articles:sync' do
  include_context 'rake'

  let(:parser) { double() }
  before { ArticleParser.stub(:new).and_return(parser) }

  its(:prerequisites) { should include('environment') }

  it 'sync the report' do
    parser.should_receive(:sync)
    subject.invoke
  end
end
