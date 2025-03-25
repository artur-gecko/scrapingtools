#!/usr/bin/env ruby

if(ARGV.length == 0)
  puts "No param"
else

  filename =  ARGV.first

  File.open(filename).each_line do |line|
    #puts content.read()
    #puts content.read().grep(/^http/)#bad
    if(line.match(/^*http/))
	puts "!!\n\n\n" + line
    end
end    
    #puts content.read().scan 'http*'
end
