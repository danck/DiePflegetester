require 'spec_helper'

describe Pflegeberater do
	before do @pflegeberater = Pflegeberater.new(
		name: "Besipielberater") 
	end
	subject { @pflegeberater }

	it { should respond_to(:name) }

	describe "with name missing" do
		before { @pflegeberater.name = " "}

		it { should_not be_valid }
	end
end