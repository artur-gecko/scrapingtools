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
loc_thematch2 = html.match(/profile-modal--list\">(\s*<li>(.*\w*)*)+/)
puts loc_thematch2
puts "END"
url_thematch = html.match(/.*sameAs.*/)[0].split("content=\"")[1][0...-2]
#puts url_thematch

name_match = html.match(/og:title\" content=\"[A-Za-z\-0-9].*"/)[0][19..-2]

puts name_match+"\t"
puts loc_thematch2
puts"\t"+url_thematch
#+ close the browser and release its resources
driver.quit
end
end
