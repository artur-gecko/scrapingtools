#!/usr/bin/env ruby
require "net/http"

puts "Hm"

if(ARGV.length == 0)
  puts "No param"
else

filename =  ARGV.first
list_with_results = Array.new
blacklist = Array.new

File.open("pages.txt").each_line do |line|
  puts line.strip
  uri =  URI(line.strip)
  #puts "path:"+uri.path
  #puts "host"+uri.host
  #puts "lecimy"
  req = Net::HTTP.new(uri.host, uri.port)
  req.use_ssl = true
  begin
  res = req.request_head(uri.host)
  puts res.code
  rescue => e
	puts "error!"
  end
end

end
