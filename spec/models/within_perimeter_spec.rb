require 'spec_helper'

describe WithinPerimeter do
	before do
		center 	= Zipcode.create!( code: 12345 )
		outer	= Zipcode.create!( code: 12346 )
		@wp 	= WithinPerimeter.new(zipcode_id: center.id, 
			neighbor: outer.id, distance: 1)
	end

	subject { @wp }

	it { should be_valid }
	it { should respond_to :zipcode_id }
	it { should respond_to :neighbor }
	it { should respond_to :distance }
end
