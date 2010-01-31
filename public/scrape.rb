require 'rubygems'
require 'nokogiri'
require 'open-uri'

url = "http://www.esquire.com/drinks/drinks-full-list/"
doc = Nokogiri::HTML(open(url))
doc.css(".result_content").each do |item|
	title = puts item.at_css("h2").text
	ingredients = puts item.at_css("ul").text
end
