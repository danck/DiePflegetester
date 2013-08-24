class ContactData < ActiveRecord::Base
	validates :address_id, presence: true
end