require 'spec_helper'

describe User do
	before { @user = User.new(
		name: "Example User", 
		email: "user@example.com", 
		nicname: "Wurst",
		password: "hein1#richt",
		password_confirmation: "hein1#richt",
		role: "besucher") }

	subject { @user }

	it { should respond_to :nicname }
	it { should respond_to :email }
	it { should respond_to :name }
	it { should respond_to :password }
	it { should respond_to :password_confirmation }
	it { should respond_to :role }
	it { should respond_to :authenticate }

	it { should be_valid }

	describe "when nicname is not present" do
		before { @user.nicname = " " }
		it { should_not be_valid}
	end

	describe "when name is not present" do
		before { @user.name = " " }
		it { should_not be_valid}
	end

	# describe "when role is not present" do
	# 	before { @user.role = " " }
	# 	it { should_not be_valid}
	# end

	describe "when nicname is too long" do
		before { @user.nicname = "a"*101 }
		it { should_not be_valid }
	end

	describe "when name is too long" do
		before { @user.name = "a"*101 }
		it { should_not be_valid }
	end

	describe "when email is too long" do
		before { @user.email = "a"*101 }
		it { should_not be_valid }
	end

	describe "when password is too long" do
		before { @user.password = "a"*101 }
		it { should_not be_valid }
	end

	describe "when password is too short" do
		before { @user.password = "a"*5 }
		it { should_not be_valid }
	end

	describe "when password is not matching" do
		before { @user.password_confirmation = "a"*3 }
		it { should_not be_valid }
	end

	describe "when role is too long" do
		before { @user.nicname = "a"*101 }
		it { should_not be_valid }
	end

	describe "when email already taken" do
  		before do
  			user_with_dublette_email = @user.dup
    	  	user_with_dublette_email.attributes = { email: @user.email.upcase }
  			user_with_dublette_email.save
  		end

  		it { should be_invalid }
	end

	describe "when nicname already taken" do
  		before do
  			user_with_dublette_alias = @user.dup
    	  	user_with_dublette_alias.attributes = { nicname: @user.nicname.upcase }
  			user_with_dublette_alias.save
  		end

  		it { should be_invalid }
	end

	describe "when user email is saved with upcase letters" do
		before do 
    		@user.attributes = { email: "CAPITAL@CASE.COM" }
    		@user.save
		end

	    it "should have only downcase letters" do
	    	@user.email.should eq "capital@case.com"
	    end

	    it "should have only downcase after being reloaded from db" do
	    	@user.reload.email.should eq "capital@case.com"
	    end
	end


	describe "when email address is valid" do
  		before { @user.update_attributes name: "Harald Test"}
		it "should be valid" do
  			addresses = %w[bla@foo.com bla.foo@foo.to bla@bla.fu.com
  				bla+foo@bla.cn]
  			addresses.each do |valid_address|
  				@user.email = valid_address
  				expect(@user).to be_valid
  			end
		end
  	end

	describe "when email is invalid" do
  		it "should be invalid" do
  			addresses = %w[bla@foo,com bla_at_foo.com bla@foo. foo@bl_a.com
  				foo@foo+bla.jp not@valid..com]
  			addresses.each do |invalid_address|
  				@user.email = invalid_address
  				expect(@user).to be_invalid
  			end
		end
	end

	describe "return value of authenticate method" do
		before { @user.save }
		let(:found_user) { User.find_by(email: @user.email) }

		describe "with valid password" do
			it { should eq found_user.authenticate(@user.password) }
		end

		describe "with invalid password" do
			let(:user_for_invalid_password) { found_user.authenticate("invalid") }

			it { should_not eq user_for_invalid_password }
			specify { expect(user_for_invalid_password).to be_false }
		end
	end
end
