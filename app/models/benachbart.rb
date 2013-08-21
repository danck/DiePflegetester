class Benachbart < ActiveRecord::Base
	belongs_to :postleitzahl

	validates :startpunkt, 	presence: true
	validates :nachbar, 	presence: true
end