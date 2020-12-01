class WebLog
  attr_accessor :views
  PageView = Struct.new(:url, :ip_address)

  def initialize
    @views = []
  end

  def add_view(view)
    views.push(PageView.new(view[0], view[1]))
  end

  def unique_views
    views.uniq
  end
end
