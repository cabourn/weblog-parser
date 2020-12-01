require_relative '../../lib/log_parser'
require 'tempfile'

RSpec.describe LogParser do
  subject { described_class.new(test_logs, web_log: web_log) }
  let(:web_log) { WebLog.new }

  let(:test_logs) do
    Tempfile.new('weblogs').tap do |f|
      views.each do |view|
        f << view.join(' ') + "\n"
      end
      f.close
    end
  end

  after do
    test_logs.unlink
  end

  context "with a correctly formatted file" do
    let(:views) do
      [
        ["/about", '123.456.789.123'],
        ["/home", '123.456.789.123'],
        ["/home", '123.456.789.123'],
        ["/home", '987.654.321.987'],
        ["/contact", '454.451.246.489']
      ]
    end

    it "parses logs from a textfile into a web log object" do
      subject.execute
      expect(web_log.views.size).to eq(5)
      expect(web_log.views.first.url).to eq("/about")
      expect(web_log.views.first.ip_address).to eq("123.456.789.123")
    end
  end

  context "with a incorrectly formatted file" do
    let(:views) do
      [
        ["/about", '123.456.789.123'],
        ["/home", '123.456.789.123'],
        ["/home"],
        ["/home", '987.654.321.987'],
        ["/contact", '454.451.246.489']
      ]
    end
    it "raises a no file error when no file is provided" do
      expect { subject.execute }.to raise_error(FileFormatError)
    end
  end
end
