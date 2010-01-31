class CreateIngredients < ActiveRecord::Migration
  def self.up
    create_table (:ingredients, :primary_key => 'id') do |t|
      t.integer :id
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :ingredients
  end
end
