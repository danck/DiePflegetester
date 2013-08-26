require 'spec_helper'

describe "AnbieterPages" do
  
  	subject { page }

  	describe "Index Page" do
  		describe "for non-signed in users" do
  			before { visit anbieter_index_path }

  			it { should have_title 'Anmelden'}
  		end

  		describe "for signed-in but non-admin users" do
  			let(:user) { FactoryGirl.create(:user)}
  			before do 
  				sign_in user, no_capybara: true
  				get anbieter_index_path
  			end

  			specify { expect(response).to redirect_to root_url }
  		end

  		describe "for admin users" do
  			let(:admin) { FactoryGirl.create(:admin)}
  			before do
  				sign_in admin
  				visit anbieter_index_path
  			end

  			it { should have_title 'Anbieterverwaltung'}
  			it { should have_content 'Anbieter'}
  		end
  	end

  	describe "Anbieter Page" do
  		describe "for non-signed in users" do
	  		let(:anbieter) { FactoryGirl.create(:anbieters)}
	  		before { visit anbieter_path(anbieter) }

	  		it { should have_title anbieter.name }
	  		it { should have_content anbieter.name }
	  		it { should_not have_content 'Bearbeiten' }
	  		it { should have_content 'Kontakt' }
	  		it { should have_content 'Kommentare' }
	  	end
  	end
end