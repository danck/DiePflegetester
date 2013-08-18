require 'spec_helper'

describe "UserPages" do
	subject { page }

	describe "Registrierungsseite" do
		before { visit registrieren_path(@user = User.new) }

		it { should have_title full_title('Registrieren')}
		it { should have_content 'Konto'}
	end

	describe "Profilseite" do
		describe "for normal users" do
			let(:user) {FactoryGirl.create(:user)}
			before do
				sign_in user
				visit user_path(user)
			end

			it { should have_title user.nicname}
			it { should have_content user.nicname}
			it { should_not have_content "Admin Dashboard"}
		end

		describe "for admin users" do
			let(:admin) {FactoryGirl.create(:admin)}
			before do
				sign_in admin
				visit user_path(admin)
			end

			it { should have_content "Admin Dashboard"}
		end
	end

	describe "edit" do
		let(:user) { FactoryGirl.create(:user) }
		before do 
			sign_in user
			visit edit_user_path(user) 
		end

		describe "page" do
			it { should have_content 'Profil bearbeiten' }
			it { should have_button 'Speichern' }

			describe "with invalid data" do
				before { click_button 'Speichern' }

				it { should have_content 'error' }
			end

			describe "with valid data" do
				let(:new_name)	{ "My New Name" }
				let(:new_email)	{ "my@new.email"}
				before do
					fill_in "user_nicname",				with: user.nicname
					fill_in "user_name",				with: new_name
					fill_in "user_email",				with: new_email
					fill_in "user_password",			with: user.password
					fill_in "user_password_confirmation",	with: user.password_confirmation
					click_button 'Speichern'
				end

				it { should have_selector('div.alert.alert-success')}
				specify { expect(user.reload.name).to	eq new_name }
				specify { expect(user.reload.email).to	eq new_email }
			end
		end
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

			describe "after successful anmeldung" do
				before { click_button submit }
				it { should have_link 'Profil' }
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

	describe "index (admin only!)" do
		let(:admin) { FactoryGirl.create(:admin) }
		before do
			sign_in admin
			visit users_path
		end

		it { should have_link 'delete'}
		it "should be able to delete a user" do
			expect do
				click_link('delete', match: :first) # method: :delete ???
			end.to change(User, :count).by(-1)
		end
		# Test, ob sich admin selbst loeschen darf:
		# it { should_not have_link('delete', href: user_path(admin))}
	end

	# Nicht fuer Normale Nutzer!!
	# describe "pagination" do
	# 	before(:all)	{ 30.times { FactoryGirl.create(:users)} }
	# 	after(:all)		{ User.delete_all }

	# 	it { should have_selector 'ul pagination' }

	# 	it "should list each user" do
	# 		User.paginate(page: 1) do |user|
	# 			expect(page).to have_selector('li', text: user.name)
	# 		end
	# 	end
	# end
end