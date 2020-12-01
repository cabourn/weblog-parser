class Formatter
  def output(title, description, results)
    puts title
    results.each do |result|
      url = result[0]
      count = result[1]
      puts "#{url} #{count} #{description}#{count == 1 ? '' : 's'}"
    end
    print "\n"
  end
end
