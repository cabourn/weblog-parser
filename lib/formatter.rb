class Formatter
  def output(title, description, results)
    puts title
    results.each do |result|
      puts "#{result[0]} #{result[1]} #{description}"
    end
    print "\n"
  end
end
