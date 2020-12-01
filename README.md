# Web Log Parser

This code takes a log file as an argument and parses this into a printer friendly format. It cam be used at follows.

```zsh
ruby parser.rb webserver.log
```

The log is parsed into a WebLog object which contains further methods such as the option to add further page views down the line.

```ruby
web_log = WebLog.new

```
