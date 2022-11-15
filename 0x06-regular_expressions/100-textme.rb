#!/usr/bin/env ruby
puts ARGV[0].scan(/\[from:(\+?[0-9]{11})\] \[to:(\+?[0-9]{11})\] \[flags:(.{12})\]/).join(",")
