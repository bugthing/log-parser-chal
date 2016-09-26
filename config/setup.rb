require 'bundler/setup'

lib_path = File.expand_path '../../lib', __FILE__
$LOAD_PATH.unshift lib_path

require 'log_parser'
require 'stats_collector'
