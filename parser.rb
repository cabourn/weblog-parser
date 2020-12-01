require './lib/web_log'
require './lib/log_parser'

web_log = WebLog.new
LogParser.new(ARGV.first, web_log: web_log).execute
web_log.output
