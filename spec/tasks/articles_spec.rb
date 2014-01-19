require 'spec_helper'

describe 'articles:sync' do
  include_context 'rake'

  its(:prerequisites) { should include('environment') }

  it 'sync the report' do
    Article.should_receive(:sync)
    subject.invoke
  end
end