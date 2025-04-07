#!/usr/bin/env ruby

require "selenium-webdriver"
# USAGE:
# put clutch profile addresses to config_files/clutch_addresses.txt file (line by line)
# set the is_windows variable below (WSL => true, Mac => false)
# call sudo gem install selenium-webdriver before running
# output on MacOS is ready to copy to doc, on Windows you have to create a .csv and open it with Excel or OpenOfficeCalc (; separator) and then you can copy from there
$iswindows = false

def main

    # define the browser options


    # to run Chrome in headless mode
    #options.add_argument("--headless") # comment out in development
    # create a driver instance to control Chrome
    # with the specified options

    puts "VERY IMPORTANT!!!

    In case there are lot of missing data (CHECK_MANUALLY),

    try to run the script for a second time!!!

    Chrome cache is being generated and problems are avoided on the second run:
    There should be much less corrupted data.\n\n"

    File.open("config_files/clutch_addresses.txt", "r") do |file_handle|
        file_handle.each_line do |line|
            goToAddressAndParse(line)
        end
    end
end


def goToAddressAndParse(address)
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument("--no--sandbox")
    options.add_argument("--disable-gpu")
    options.add_argument("--disable-dev-shm-usage")
    options.add_argument("--disable-browser-side-navigation")
    options.add_argument("--enable-automation")
    driver = Selenium::WebDriver.for :chrome, options: options
    driver.manage.timeouts.implicit_wait = 20
    driver.manage.timeouts.script_timeout = 20
    driver.manage.timeouts.page_load = 20
    # connect to the target page
    driver.navigate.to address

    # extract the HTML of the target page
    # and print it
    html = driver.page_source
    #puts html
    begin
        loc_thematch = html.match(/locality.*/)[0][19..-3]
        rescue NoMethodError
        loc_thematch = "CHECK_MANUALLY"
    end
    #puts loc_thematch
    begin
        url_thematch = html.match(/.*sameAs.*/)[0].split("content=\"")[1][0...-2]
        rescue NoMethodError
        url_thematch = "CHECK_MANUALLY"
    end
    #puts url_thematch
    begin
        name_match = html.match(/og:title\" content=\"[A-Za-z\-0-9].*"/)[0][19..-2]
        rescue NoMethodError
        name_match = "CHECK_MANUALLY"
    end

    separator = ($iswindows==true)?(";"):("\t")

    puts name_match+separator+loc_thematch+separator+url_thematch
    # close the browser and release its resources
    driver.quit
end


main
