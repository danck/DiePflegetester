require 'spec_helper'

describe "AuthenticationPages" do
  
  	subject { page }

  	describe "authorization" do

  		describe "as wrong user" do
  			let(:user) { FactoryGirl.create(:user) }
  			let(:wrong_user) { FactoryGirl.create(:user2) }
  			# before { sign_in user, no_capybara: true }

  			describe "visiting wrong users edit page" do
  				before do 
  					sign_in user
  					visit edit_user_path(wrong_user)
  				end

  				it { should_not have_title 'Profil bearbeiten' }
  				specify { expect(page).to have_title 'Start' }
  			end

  			describe "submitting a PATCH request to wrong users#update action" do
  				before do 
  					sign_in user, no_capybara: true
  					patch patch_user_path(wrong_user)
  				end
  				specify { expect(response).to redirect_to root_url }
  			end

  			describe "visiting the users index" do
  				let(:user) { FactoryGirl.create(:user) }
  				before do 
  					sign_in user
  					visit users_path
  				end

  				it "should redirect_to root" do
  					expect(page).to have_title 'Start'
  				end
  			end

  			describe "delete a user" do
  				before do
  					sign_in wrong_user, no_capybara: true
  					delete user_path(user)
  				end
  				specify { expect(response).to redirect_to root_url }
  			end
  		end

  		describe "as admin user" do
  			let(:admin) { FactoryGirl.create(:admin) }
  			before { sign_in admin }

  			describe "Users index" do
  				before { visit users_path }
  				it { should have_title 'Benutzerverwaltung' }
  			end
  		end

  		describe "for non-signed-in users" do
  			let(:user) { FactoryGirl.create(:user) }

  			describe "when attempting to visit a protected page ('edit')" do
  				before do
  					visit edit_user_path(user)
  					fill_in "Email",	with: user.email
  					fill_in "Passwort",	with: user.password
  					click_button "Anmelden"
  				end

  				describe "after signin in" do
  					it "should render the formerly protected page ('edit')" do
  						expect(page).to have_title 'Profil bearbeiten'
  					end
  				end
  			end

  			describe "in the Users controller" do

  				describe "visiting the edit page" do
  					before { visit edit_user_path(user) }
  					it { should have_title 'Anmelden'}
  				end

  				describe "submitting the update action" do
  					before do 
  						patch user_path(user)
  					end
  					specify { expect(response).to redirect_to(anmelden_path) }
  				end

  				describe "visiting the user index" do
  					before { visit users_path }
  					it { should have_title 'Anmelden'}
  				end
  			end
  		end
  	end

  	describe "signin page" do
	  	before { visit anmelden_path }

	  	it { should have_content 'Anmelden' }

	  	describe "with invalid information" do
	  		before { click_button "Anmelden" }

	  		it { should have_title 'Anmelden'}
	  		# it { should have_content 'div.alert-danger'}

	  		describe "after visiting another page" do
	  			before { click_link 'Start' }
	  			it { should_not have_content 'div.alert-danger'}
	  		end
		end

		describe "with valid information" do
			let (:user) { FactoryGirl.create(:user) }
			before do
				fill_in "Email",	with: user.email.upcase
				fill_in "Passwort",	with: user.password
				click_button "Anmelden"
			end

			it { should have_link 'Abmelden'}
			# TODO it { should have_link 'Merkliste'}

			describe "after successful signout" do
				before {click_link 'Abmelden'}
				it { should have_link 'Anmelden'}
			end
		end
	end
end