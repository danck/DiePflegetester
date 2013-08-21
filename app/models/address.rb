class Address < ActiveRecord::Base
	belongs_to :zipcode

	validates :street,
		presence: true
	validates :number,
		presence: true,
		numericality: { only_integer: true }
	validates :zipcode_id,
		presence: true,
		numericality: { only_integer: true }
end
