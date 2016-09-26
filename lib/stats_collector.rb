require 'ostruct'

class StatsCollector
  attr_reader :log

  def initialize(log:)
    @log = log
  end

  def by_u_views
    stats.sort_by { |k,v| v.u_views }.reverse_each.map { |a| a[1] }
  end

  def by_views
    stats.sort_by { |k,v| v.views }.reverse_each.map { |a| a[1] }
  end

  private

  # this private method is long, complex and prime for a refactor
  # .. if I had more time I would
  def stats
    @stats ||= begin
      collection = Hash.new do |hash, key|
        hash[key] = OpenStruct.new views: 0,
                                   u_views: 0,
                                   path: key,
                                   ips: Hash.new(0)
      end

      log.each do |line|
        stat = collection[line.page]

        stat.views += 1
        stat.u_views += 1 unless stat.ips.key?(line.ip)
        stat.ips[line.ip] += 1
      end

      collection
    end
  end
end
