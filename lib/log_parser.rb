class LogParser
  attr_reader :log_fh

  def initialize(log_file:)
    File.open(log_file, 'r')
  end
end
