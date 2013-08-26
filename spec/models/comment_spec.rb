require 'spec_helper'

describe Comment do
	before { @comment = FactoryGirl.create(:comments) }
	subject { @comment }

	it { should be_valid }
end