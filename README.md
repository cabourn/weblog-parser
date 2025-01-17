# Web Log Parser

This code takes a log file as an argument and parses this into a printer friendly format. It cam be used at follows.

```zsh
ruby parser.rb webserver.log
```

The following is output into the terminal

```zsh
Total Page Views
/about/2 90 views
/contact 89 views
/index 82 views
/about 81 views
/help_page/1 80 views
/home 78 views

Total Unique Page Views
/help_page/1 23 unique views
/contact 23 unique views
/home 23 unique views
/index 23 unique views
/about/2 22 unique views
/about 21 unique views
```

The log is parsed into a WebLog object which contains further methods such as the option to add further page views down the line.

```ruby
web_log = WebLog.new
new_page_view = ["/about", '123.456.789.123']
web_log.add_view(new_page_view)

pp web_log.views.last

> #<struct WebLog::PageView url="/about", ip_address="123.456.789.123">
```

Further, the WebLog class comes with a default formatter for the command line, but can be changed at runtime to a newly created formatter such as CSV. Please note that the below example assumes a CSV formatter class has been coded to be plugged into the current class.

```ruby
web_log = WebLog.new
new_formatter = CsvFormatter.new
web_log.formatter = new_formatter
web_log.output
```
