class Ingredient < ActiveRecord::Base
	has_and_belongs_to_many :recipes
	has_many :ingredients_recipes_quantities
	has_many :quantities, :through => :ingredients_recipes_quantities
end
