class WithinPerimeter < ActiveRecord::Base
	belongs_to :zipcode

	validates :zipcode_id,
		presence: true,
		numericality: { only_integer: true },
		uniqueness: { scope: :neighbor }
	validates :neighbor,
		presence: true,
		numericality: { only_integer: true }
	validates :distance,
		presence: true,
		numericality: { only_integer: true }
end