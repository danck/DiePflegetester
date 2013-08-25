require 'spec_helper'

describe Zipcode do
	before { @zip = FactoryGirl.create(:zipcodes)}
	
	subject { @zip }

	it { should respond_to :code }
	it { should respond_to :neighbors }
	it { should respond_to :within_perimeters }
	it { should respond_to :anbieters }

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

	describe "neighbors" do
		before do
			zc1 = Zipcode.create!(code: 12345)
			zc2 = Zipcode.create!(code: 12346)
			zc3 = Zipcode.create!(code: 12347)
			zc1.neighbors.add(zc2, distance: 6)
			# TODO!!!
		end
	end
end