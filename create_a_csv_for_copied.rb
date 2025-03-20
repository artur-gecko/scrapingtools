#!/usr/bin/env ruby
require 'clipboard'

# requires 'clipboard' ruby gem in order to work on all systems,
# call:
# sudo gem install clipboard
# on your machine to install it


clipboard_as_string = Clipboard.paste()

array =  clipboard_as_string.split("\n")
# use last name field as placeholder for company name
thestring = "FirstName,LastName,Gender,Email\n"

puts "This script takes e-mails from your clipboard and generates csv ready for applying to MailMerge. If you have e-mail addresses (line by line, like copied from a column in spreadsheet) in the clipboard, it generates csv with only emails (like ,,,shit@fuck.com)
If you copy two columns: first with company names and the the second with subsequent e-mails, it generates csv with company names in place of LastName. In mail template you write in the appropriate place:

We have experience in working as a subcontractor with companies as {{LastName}} bla bla.

and MailMerge should put the company's name into the placeholder"

first_element_at_all = array[0].split("\t")[0]

if first_element_at_all.include? "@"
  for i in 0..array.length-1 do
      thestring+=",,,#{array[i].split("\t")[0]}\n"
  end
else
  for i in 0..array.length-1 do
    thestring+=",#{array[i].split("\t")[0]},,#{array[i].split("\t")[1]}\n"
  end
end

puts "RESULT BELOW, ALSO COPIED TO CLIPBOARD:"
puts thestring

Clipboard.copy(thestring)
