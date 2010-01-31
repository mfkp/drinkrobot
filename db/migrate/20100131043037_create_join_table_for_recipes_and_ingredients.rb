class CreateJoinTableForRecipesAndIngredients < ActiveRecord::Migration
  def self.up
  	create_table :ingredients_recipes do |t|
  	  t.integer :recipe_id
  	  t.integer :ingredient_id
  	  t.timestamps
  	end
  end

  def self.down
  	drop_table :ingredients_recipes
  end
end
