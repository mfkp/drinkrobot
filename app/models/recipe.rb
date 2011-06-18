class Recipe < ActiveRecord::Base
	has_many :ingredients_recipes_quantities
    has_many :ingredients, :through => :ingredients_recipes_quantities
    has_many :quantities, :through => :ingredients_recipes_quantities
    
	def self.all_cached
	  Rails.cache.fetch('Recipe.all') { all }
	end

	after_save    :expire_recipe_all_cache
	after_destroy :expire_recipe_all_cache

	def expire_recipe_all_cache
	  Rails.cache.delete('Recipe.all')
	end

    def self.search(query)
		if !query.to_s.strip.empty?
			tokens = query.split.collect {|c| "%#{c.downcase}%"}
			find_by_sql(["select i.* from recipes i where #{ (["(lower(i.name) like ? or lower(i.name) like ?)"] * tokens.size).join(" and ") } order by i.name asc", *(tokens * 2).sort])
		else
			[]
		end
	end
end
