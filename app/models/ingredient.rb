class Ingredient < ActiveRecord::Base
	has_and_belongs_to_many :recipes
	has_many :ingredients_recipes_quantities
	has_many :quantities, :through => :ingredients_recipes_quantities
	
	def self.search(query)
		if !query.to_s.strip.empty?
			tokens = query.split.collect {|c| "%#{c.downcase}%"}
			find_by_sql(["select i.* from ingredients i where #{ (["(lower(i.name) like ? or lower(i.name) like ?)"] * tokens.size).join(" and ") } order by i.name asc", *(tokens * 2).sort])
		else
			[]
		end
	end
	
end
