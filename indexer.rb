#!/usr/bin/ruby

words = {}

ARGV.each do |arg|
  f = File.open(arg)
  filename = arg.split("/").last
  w = f.read.downcase.split(/[\W_]+/)
  w.each do |word| 
    size = w.size
    w.reject! {|i| i == word}
    words[word] = size - w.size
  end
  f.close()
  words = words.sort {|a, b| b[1]<=>a[1]}
  words.each {|k, v| puts "'#{k}' appears #{v} times in #{filename}" unless k.length == 0}
end