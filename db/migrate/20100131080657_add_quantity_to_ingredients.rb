class AddQuantityToIngredients < ActiveRecord::Migration
  def self.up
  	add_column :ingredients, :quantity, :string
  end

  def self.down
  	remove_column :ingredients, :quantity
  end
end
