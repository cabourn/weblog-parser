require_relative './formatter'

class WebLog
  attr_accessor :views, :formatter
  PageView = Struct.new(:url, :ip_address)

  def initialize(formatter: Formatter.new)
    @views = []
    @formatter = formatter
  end

  def add_view(view)
    views.push(PageView.new(view[0], view[1]))
  end

  def unique_views
    views.uniq
  end

  def view_count
    count(views)
  end

  def unique_view_count
    count(unique_views)
  end

  def output
    formatter.output("Total Page Views", "view", view_count)
    formatter.output("Total Unique Page Views", "unique view", unique_view_count)
  end

  private

    def count(arr)
      arr.map { |item| item.url }.tally.sort_by { |url, count| -count }
    end
end
