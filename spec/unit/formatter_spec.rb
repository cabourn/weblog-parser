require_relative '../../lib/formatter'

RSpec.describe Formatter do
  subject { described_class.new }

  let(:results) do
    { "/about" => 15, "/contact"=>12, "/products" => 10 }
  end

  let(:expected_views_output) do
    <<~RESULTS
      Total Page Views
      /about 15 views
      /contact 12 views
      /products 10 views

    RESULTS
  end

  let(:expected_unique_views_output) do
    <<~RESULTS
      Total Page Unique Views
      /about 15 unique views
      /contact 12 unique views
      /products 10 unique views

    RESULTS
  end

  it "prints results in the correct format" do
    expect { subject.output("Total Page Views", "views", results) }.to output(expected_views_output).to_stdout
  end

  it "prints unique results in the correct format" do
    expect { subject.output("Total Page Unique Views", "unique views", results) }.to output(expected_unique_views_output).to_stdout
  end
end
