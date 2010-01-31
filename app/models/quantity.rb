class Quantity < ActiveRecord::Base
	belongs_to_many :ingredients
end
