require 'spec_helper'

describe "UserPages" do
	subject { page }

	describe "Registrierungsseite" do
		before { visit registrieren_path(@user = User.new) }

		it { should have_title full_title('Registrieren')}
		it { should have_content 'Konto'}
	end

	describe "Profilseite" do
		let(:user) {FactoryGirl.create(:user)}
		before { visit user_path(user)}

		it { should have_title user.nicname}
		it { should have_content user.nicname}
	end

	describe "registrieren" do
		before { visit registrieren_path }

		let(:submit) { "Jetzt registrieren"}

		describe "with no information" do
			it "shouldn't create a user" do
				expect { click_button submit }.to change(User, :count).by(0)
			end
		end

		describe "with valid information" do
			before do
				fill_in "Name",					with: "valid"
				fill_in "Alias",				with: "valid"
				fill_in "Email",				with: "vali@valid.valid"
				fill_in "Passwort",				with: "validvalid"
				fill_in "Passwort bestätigen",	with: "validvalid"
			end

			it "should create user" do
				old_count = User.count
	    		click_button submit
	    		new_count = User.count
	    		expect(new_count).to eq old_count+1
			end
		end

		describe "with invalid information" do
			before do
				fill_in "Name",					with: ""
				fill_in "Alias",				with: "valid"
				fill_in "Email",				with: "vali@valid.valid"
				fill_in "Passwort",				with: "validvalidas"
				fill_in "Passwort bestätigen",	with: "validvalid"
			end

			describe "should not create user" do
				it  do
					old_count = User.count
	    			click_button submit
	    			new_count = User.count
		    		expect(new_count).to eq old_count
				end
			end

			describe "should show error message" do
				before { click_button submit }
				it { should have_content 'error' }
			end
		end
	end
end