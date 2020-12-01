require_relative '../../lib/web_log.rb'

RSpec.describe WebLog do
  subject { described_class.new }

  it "can add new page views to the log" do
    subject.add_view(["about/", "123.456.789"])
    expect(subject.views.size).to be(1)
  end

  it "returns the url of a particular page view" do
    subject.add_view(["about/", "123.456.789"])
    page_view = subject.views.first
    expect(page_view.url).to eq("about/")
  end

  it "returns the ip address of a particular page view" do

  end

  it "holds a history of page views in the correct format"
  it "returns a set of unique page views"
end
