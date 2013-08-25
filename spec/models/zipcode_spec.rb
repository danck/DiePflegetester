require 'spec_helper'

describe Zipcode do
	before { @zip = FactoryGirl.create(:zipcodes)}
	
	subject { @zip }

	it { should respond_to :code }
	it { should respond_to :neighbors }
	it { should respond_to :within_perimeters }
	it { should respond_to :addresses }

	describe "with valid data" do
		before { @zip.update_attributes(code: 12345)}
		it { should be_valid }
	end

	describe "with invalid data" do
		before { @zip.update_attributes(code: 1234)}
		it { should_not be_valid }

		before { @zip.update_attributes(code: "abc")}
		it { should_not be_valid }		
	end
end