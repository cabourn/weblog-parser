class LogParser
  attr_reader :log_file
  attr_accessor :web_log

  def initialize(log_file, web_log: WebLog.new)
    @log_file = log_file
    @web_log = web_log
  end

  def execute
    File.foreach(log_file) { |line| web_log.add_view(line.split(" ")) }
  end
end
