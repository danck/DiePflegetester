class Anbieter < ActiveRecord::Base
	has_one :contact_data

	# validates :contact_data_id, 
	# 	presence: true,
	# 	numericality: { only_integer: true }
end