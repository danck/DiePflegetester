require 'spec_helper'

describe Address do
	before { @address = FactoryGirl.create(:addresses)}
	subject { @address }

	it { should be_valid }
end