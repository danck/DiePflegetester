class ContactData < ActiveRecord::Base
	has_one :address
end