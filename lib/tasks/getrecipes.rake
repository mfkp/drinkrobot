namespace :db do
	desc "Load drink recipes"
	task :load_drinks => :environment do
		require 'rubygems'
		require 'nokogiri'
		require 'open-uri'

		num = 1
		while num <= 6214
		#while num <= 1
			url = "http://www.webtender.com/db/browse?level=2&dir=drinks&char=*&start=" + num.to_s()
			page = Nokogiri::HTML(open(url))
			page.css("li").each do |li|
				drink_url = "http://www.webtender.com" + li.at_css("a")[:href]
				drink_page = Nokogiri::HTML(open(drink_url))
				name = drink_page.at_css("h1").text
				puts name
				instructions = drink_page.at_css("td p").text
				
				if Recipe.find(:first, :conditions => {:name => name}) == nil
					@recipe = Recipe.new(:name => name, :instructions => instructions)
					@recipe.save
		
					drink_page.css("ul li").each do |li|
						ingredient = li.at_css(".ingr").text
						quantity = li.text.gsub(ingredient, '').chomp.strip
						if Ingredient.find(:first, :conditions => {:name => ingredient}) == nil
							@ingredient = Ingredient.new(:name => ingredient)
							@ingredient.save
						else
							@ingredient = Ingredient.find(:first, :conditions => {:name => ingredient})
						end
						if Quantity.find(:first, :conditions =>	{:quantity => quantity}) == nil
							@quantity = Quantity.new(:quantity => quantity)
							@quantity.save
						else
							@quantity = Quantity.find(:first, :conditions => {:quantity => quantity})
						end
						@ingredients_recipe_quantity = IngredientsRecipesQuantity.new(:recipe_id => 
							@recipe.id, :ingredient_id => @ingredient.id, :quantity_id => @quantity.id)
						@ingredients_recipe_quantity.save
					end
				end
			end
			num += 150
		end
	end
	
	desc "Drop, create, migrate the development database"
	task :clear => [
		'environment',  
		'db:drop', 
		'db:create', 
		'db:migrate'
	]
end
