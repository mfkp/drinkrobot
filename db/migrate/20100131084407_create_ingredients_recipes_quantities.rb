class CreateIngredientsRecipesQuantities < ActiveRecord::Migration
  def self.up
    create_table :ingredients_recipes_quantities do |t|
      t.integer :id
	  t.integer :recipe_id
  	  t.integer :ingredient_id
  	  t.integer :quantity_id
      t.timestamps
    end
  end

  def self.down
    drop_table :ingredients_recipes_quantities
  end
end
