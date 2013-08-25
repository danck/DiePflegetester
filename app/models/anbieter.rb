class Anbieter < ActiveRecord::Base
	belongs_to :zipcode, inverse_of: :anbieters

	validates :zipcode_id, 
		presence: true,
		numericality: { only_integer: true }
end