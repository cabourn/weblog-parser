require 'pathname'

class LogParser
  attr_accessor :web_log, :log_file

  def initialize(log_file, web_log: WebLog.new)
    @log_file = log_file
    @web_log = web_log
  end

  def execute
    File.foreach(log_file) do |line|
      data = line.split(" ")
      raise FileFormatError if data.length != 2
      web_log.add_view(data)
    end
  end
end

class FileFormatError < StandardError
  def initialize(msg="The file data appears to be in an incorrect format")
    super
  end
end
