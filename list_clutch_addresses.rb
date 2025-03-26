#!/usr/bin/env ruby

if(ARGV.length == 0)
  puts "No param"
else

  filename =  ARGV.first
  list_with_results = Array.new
  File.open(filename).each_line do |line|
    #puts content.read()
    #puts content.read().grep(/^http/)#bad
   thematch = line.match(/.*https:\/\/clutch\.co\/profile\/([a-zA-Z0-9-]*)\"\s/)
    
    if(line.match(/.*https:\/\/clutch\.co\/profile\/([a-zA-Z0-9-]*)\"\s/))
      thematchstripped = thematch[1].strip
      concatenated = "https://clutch.co/profile/"+thematchstripped
      list_with_results << concatenated
    end

    end

puts list_with_results.uniq
end
