class Zipcode < ActiveRecord::Base
	has_many :within_perimeters, foreign_key: :neighbor, dependent: :destroy
	has_many :neighbors, through: :within_perimeters, source: :zipcode
	has_many :addresses

	validates :code, 
		presence: true,
		length: { is: 5 },
		numericality: { only_integer: true }
end