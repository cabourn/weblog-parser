class WebLog
  attr_accessor :views

  def initialize
    @views = []
  end

  def add_view(view)
    views.push(view)
  end
end
