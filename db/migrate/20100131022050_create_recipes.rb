class CreateRecipes < ActiveRecord::Migration
  def self.up
    create_table :recipes do |t|
      t.integer :id
      t.string :name
      t.string :picture

      t.timestamps
    end
  end

  def self.down
    drop_table :recipes
  end
end
