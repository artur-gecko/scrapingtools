#!/usr/bin/env ruby

require "selenium-webdriver"

# call sudo gem install selenium-webdriver before running

# define the browser options
options = Selenium::WebDriver::Chrome::Options.new
# to run Chrome in headless mode
#options.add_argument("--headless") # comment out in development
# create a driver instance to control Chrome
# with the specified options

File.open("clutchsyf.txt", "r") do |file_handle|
file_handle.each_line do |line|
puts "=================================================="
driver = Selenium::WebDriver.for :chrome, options: options


# connect to the target page
driver.navigate.to line

# extract the HTML of the target page
# and print it
html = driver.page_source
#puts html
loc_thematch = html.match(/locality.*/)[0][19..-3]
#puts loc_thematch
puts "TESTY"
loc_match2 = html.match(/profile-modal--list\">(\s*<li>(.*\w*)*)+/)
#puts loc_thematch2
if(loc_match2!=nil and loc_match2[0] != nil)
loc_match_city_full = loc_match2[0].match(/<li>.*<span>/)
loc_match_country_full = loc_match2[0].match(/span.*span/)
#puts "Items:"
item = loc_match2.to_a[0]
    #puts "Item: ========"+item+"========" #item jest ok, trzeba teraz sparsować
    thematch = item.scan(/li>.*span/)
    someval = thematch
    puts "Generating locations list:"
    for item in someval
	puts "JUPI!"+item[3..-7].split("span").join("PLUM")+"ENDJUPI"
	end

    # if(item!=nil && item!="")
    # val1 = item.match(/<li>.*<span>/)
    #     if(val1!=nil)
    #         puts "\tcity:"+val1[0]
    #     end
    # end
    # val2 = item.match(/span.*span/)
    # if(val2!=nil)
    #     puts "\tcountry"+val2[0]

    # end
#puts "Match!"+loc_match2.to_a
end
#if(loc_match_city_full[0] != nil)
#puts "CITY_MATCH:"+loc_match_city_full[0][4..-8]+"+"
#end
#if(loc_match_country_full[0] !=nil)
#puts "COUNTRY_MATCH:" + loc_match_country_full[0][7..-7]
#end
#puts "END"
url_thematch = html.match(/.*sameAs.*/)[0].split("content=\"")[1][0...-2]
#puts url_thematch

name_match = html.match(/og:title\" content=\"[A-Za-z\-0-9].*"/)[0][19..-2]

#puts "NAME_MATCH:"+name_match+"\t"
#puts "LOC_MATCH2:"+loc_match_city_full[0][4..-8] +":"+ loc_match_country_full[0][7..-7] +":"
#puts"URL:"+url_thematch
complete_place = loc_match_city_full[0][4..-8]+", "+loc_match_country_full[0][7..-7]
puts name_match+"\t"+complete_place+"\t"+url_thematch
#+ close the browser and release its resources
driver.quit
end
end
