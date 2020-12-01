require_relative '../../lib/web_log.rb'

RSpec.describe WebLog do
  subject { described_class.new }

  def add_test_view
    subject.add_view(["about/", "123.456.789"])
  end

  it "can add new page views to the log" do
    add_test_view
    expect(subject.views.size).to be(1)
  end

  it "returns the url of a particular page view" do
    add_test_view
    page_view = subject.views.first
    expect(page_view.url).to eq("about/")
  end

  it "returns the ip address of a particular page view" do
    add_test_view
    page_view = subject.views.first
    expect(page_view.ip_address).to eq("123.456.789")
  end

  it "holds a history of page views in the correct format"

  it "returns a set of unique page views" do
    views = [
      ["about/", "123.456.789"],
      ["contact/", "123.456.789"],
      ["products/", "123.456.789"],
      ["about/", "123.456.789"],
      ["about/", "789.456.123"]
    ]
    views.each { |view| subject.add_view(view) }

    expect(subject.unique_views.size).to eq(4)
  end
end
