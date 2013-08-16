require 'spec_helper'

describe "AuthenticationPages" do
  
  	subject { page }

  	describe "authorization" do

  		describe "for non-signed-in users" do
  			let(:user) { FactoryGirl.create(:user) }

  			describe "in the Users controller" do

  				describe "visiting the edit page" do
  					before { visit edit_user_path(user) }
  					it { should have_title 'Anmelden'}
  				end

  				describe "submitting the update action" do
  					before do 
  						patch user_path(user)
  					end
  					specify { expect(response).to redirect_to(anmelden_path)}
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
	  			before { puts @subject 
	  				click_link 'Start' }
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

			describe "after successful signout" do
				before {click_link 'Abmelden'}
				it { should have_link 'Anmelden'}
			end
		end
	end
end