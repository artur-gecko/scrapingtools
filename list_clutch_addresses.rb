#!/usr/bin/env ruby

if(ARGV.length == 0)
  puts "No param"
else

  filename =  ARGV.first

  File.open(filename).each_line do |line|
    #puts content.read()
    #puts content.read().grep(/^http/)#bad
   thematch = line.match(/.*https:\/\/clutch\.co\/profile\/([a-zA-Z0-9-]*)\"\s/)
    
    if(line.match(/.*https:\/\/clutch\.co\/profile\/([a-zA-Z0-9-]*)\"\s/))
      puts "https://clutch.co/profile/"+thematch[1]
    end
    #puts content.read().scan 'http*'
end
end
