class AddQuantityToIngredientsRecipes < ActiveRecord::Migration
  def self.up
  	add_column :ingredients_recipes, :quantity, :string
  end

  def self.down
  	remove_column :ingredients_recipes, :quantity
  end
end
