require 'spec_helper'

describe Anbieter do
	before do
		@anbieter = Anbieter.new(
			name: "Testanbieter",
			contact_data_id: ContactData.new.id )
	end

	it { should be_valid }
end