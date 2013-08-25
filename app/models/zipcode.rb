class Zipcode < ActiveRecord::Base
	has_many :within_perimeters, foreign_key: :neighbor, dependent: :destroy, inverse_of: :zipcode
	has_many :neighbors, through: :within_perimeters, source: :zipcode
	has_many :anbieters, inverse_of: :zipcode

	validates :code, 
		presence: true,
		length: { is: 5 },
		numericality: { only_integer: true },
		uniqueness: true
end