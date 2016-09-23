require 'spec_helper'

describe LogParser do
  subject(:parser) { described_class.new log_file: log_file_path }

  let(:log_file_path) { '' }

  it 'errors if can not open file' do
    expect { parser }.to raise_error Errno::ENOENT
  end

  context 'using sample file' do
    let(:log_file_path) { './spec/fixtures/webserver.log' }

    it 'contructs the parser' do
      expect{ parser }.not_to raise_error
    end
  end
end
