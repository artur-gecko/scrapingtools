require "selenium-webdriver"

# define the browser options
options = Selenium::WebDriver::Chrome::Options.new
# to run Chrome in headless mode
#options.add_argument("--headless") # comment out in development
# create a driver instance to control Chrome
# with the specified options
driver = Selenium::WebDriver.for :chrome, options: options

# connect to the target page
driver.navigate.to "https://clutch.co/profile/ideamotive"

# extract the HTML of the target page
# and print it
html = driver.page_source
#puts html
loc_thematch = html.match(/locality.*/)
puts loc_thematch

url_thematch = html.match(/.*sameAs.*/)[0].split("content=\"")[1]
puts url_thematch

name_match = html.match(/og:title\" content=\"[A-Za-z\-0-9]*/)[0].split("content=\"")[1]

puts name_match
# close the browser and release its resources
driver.quit
