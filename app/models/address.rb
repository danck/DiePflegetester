class Address < ActiveRecord::Base
	belongs_to :zipcode

	validates :zipcode_id, presence: true
end