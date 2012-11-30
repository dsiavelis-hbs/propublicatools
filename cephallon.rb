require 'rubygems'
require 'nokogiri'
filename = 'y6z84tl3z5wp2ut02009.xml' 
file = Nokogiri::XML(open(filename))

file.css('row').each do |row|

        values = row.css('value')

        puts [values[3].text, values[7].text, values[8].text].join("\t")

end