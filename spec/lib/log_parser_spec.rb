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
      expect { parser }.not_to raise_error
    end

    it 'is enumerable' do
      expect(parser).to respond_to :each
    end

    it 'yields a parsed line' do
      expect(parser.first).to have_attributes(page: '/help_page/1', ip: '126.318.035.038')
    end
  end
end
