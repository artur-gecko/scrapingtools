#!/usr/bin/env ruby

if(ARGV.length == 0)
  puts "No param"
else

  filename =  ARGV.first
  list_with_results = Array.new
  blacklist = Array.new

  File.open("config_files/blacklist.txt").each_line do |line|
	blacklist << (""+line).strip
  end
  File.open(filename).each_line do |line|
    #puts content.read()
    #puts content.read().grep(/^http/)#bad
   thematch = line.match(/.*https:\/\/clutch\.co\/profile\/([a-zA-Z0-9-]*)\"\s/)
    
    if(line.match(/.*https:\/\/clutch\.co\/profile\/([a-zA-Z0-9-]*)\"\s/))
      thematchstripped = thematch[1].strip
      concatenated = "https://clutch.co/profile/"+thematchstripped
	if not blacklist.include?concatenated
      		list_with_results << concatenated
	end
    end

    end
#puts "Blacklist:"
#puts blacklist.uniq
#puts "--"
puts list_with_results.uniq
end
