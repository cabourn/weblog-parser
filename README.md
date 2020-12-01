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

```
