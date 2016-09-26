require 'ostruct'

class LogParser
  include Enumerable

  attr_reader :log_fh

  def initialize(log_file:)
    @log_fh = File.open(log_file, 'r')
  end

  def each
    @log_fh.each { |str| yield parse(line: str) }
  end

  private

  def parse(line:)
    matches = %r{^(?<page>.+?)\s(?<ip>.+)$}.match line

    OpenStruct.new page: matches[:page],
                   ip: matches[:ip]
  end
end
