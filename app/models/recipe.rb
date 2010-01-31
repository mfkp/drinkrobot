class Recipe < ActiveRecord::Base
	has_many :ingredients_recipes_quantities
    has_many :ingredients, :through => :ingredients_recipes_quantities
end
