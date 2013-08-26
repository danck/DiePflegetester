class Anbieter < ActiveRecord::Base
	belongs_to :zipcode, inverse_of: :anbieters
	has_many :comments, inverse_of: :anbieter

	validates :zipcode_id, 
		presence: true,
		numericality: { only_integer: true }
	validates :name,
		presence: true,
		length: { maximum: 100 }
	validates :street,
		presence: true,
		length: { maximum: 100 }
	validates :street_number,
		presence: true,
		length: { maximum: 100 }
	validates :city,
		presence: true,
		length: { maximum: 100 }
	validates :phone_number,
		presence: true,
		length: { maximum: 100 }
end