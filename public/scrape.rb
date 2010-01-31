require 'rubygems'
require 'nokogiri'
require 'open-uri'

#url = "http://www.esquire.com/drinks/drinks-full-list/"
#doc = Nokogiri::HTML(open(url))
#doc.css(".result, .result_alt").each do |item|
#	item.css("li").each do |li|
#		puts li.text
#	end
#	image = puts "http://www.esquire.com" + item.at_css("img")[:src]
#end

num = 1
#while num <= 6214
while num <= 1
	url = "http://www.webtender.com/db/browse?level=2&dir=drinks&char=*&start=" + num.to_s()
	page = Nokogiri::HTML(open(url))
	page.css("li").each do |li|
		drink_url = "http://www.webtender.com" + li.at_css("a")[:href]
		drink_page = Nokogiri::HTML(open(drink_url))
		name = drink_page.at_css("h1").text
		puts name
		instructions = drink_page.at_css("td p").text
		
		@recipe = Recipe.new(:name => name, :instructions => instructions)
		@recipe.save
		
		drink_page.css("ul li").each do |li|
			ingredient = li.at_css(".ingr").text
			quantity = li.text.gsub(ingredient, '').chomp.strip
#			puts quantity + " " + ingredient
			@ingredient = Ingredient.new(:name => ingredient)
			@ingredient.save
			@ingredients_recipe = IngredientsRecipe.new(:recipe_id => @recipe.id, :ingredient_id => @ingredient.id)
			@ingredients_recipe.save
		end
#		puts instructions
		
		
	end
	num += 150
end
