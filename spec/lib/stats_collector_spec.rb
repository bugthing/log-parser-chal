require 'spec_helper'

describe StatsCollector do
  subject(:stats) { described_class.new log: parser }

  # could test better by using a double here using the real parse
  # with a fixture will be enough for now
  let(:parser) { LogParser.new log_file: log_file_path }
  let(:log_file_path) { './spec/fixtures/webserver.log' }

  describe '#by_views' do
    subject { stats.by_views }

    it 'collects stats as expected' do
      expect(subject.first.path).to eq '/about/2'
      expect(subject.first.views).to eq 90
      expect(subject.last.path).to eq '/home'
      expect(subject.last.views).to eq 78
    end
  end

  describe '#by_u_views' do
    subject { stats.by_u_views }

    it 'collects stats as expected' do
      expect(subject.first.path).to eq '/index'
      expect(subject.first.u_views).to eq 23
      expect(subject.last.path).to eq '/about'
      expect(subject.last.u_views).to eq 21
    end
  end
end
