require 'spec_helper'

describe Anbieter do
	before { @anbieter = FactoryGirl.create(:anbieters)}

	subject { @anbieter }

	it { should be_valid }
	it { should respond_to :name}
	it { should respond_to :street }
	it { should respond_to :street_number }
	it { should respond_to :city }
	it { should respond_to :phone_number }
	it { should respond_to :zipcode_id }

	describe "with invalid" do
		describe "name" do
			before { @anbieter.update_attributes(name: " ") }
			it { should_not be_valid }
		end
		describe "street" do
			before { @anbieter.update_attributes(street: " ") }
			it { should_not be_valid }
		end
		describe "street_number" do
			before { @anbieter.update_attributes(street_number: " ") }
			it { should_not be_valid }
		end
		describe "phone_number" do
			before { @anbieter.update_attributes(phone_number: " ") }
			it { should_not be_valid }
		end
		describe "zipcode_id" do
			before { @anbieter.update_attributes(zipcode_id: "asd") }
			it { should_not be_valid }
		end

	end

end