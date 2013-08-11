require 'spec_helper'
require './spec/requests/shared_static_pages.rb'

describe "Static Pages" do
	subject { page }

	it "should have the right generic links in the root Layout" do
		visit root_path
		expect(page).to have_title full_title 'Start' # utility methode aus support/utilities.rb

		click_link "Impressum"
		expect(page).to have_title(full_title('Impressum'))
		expect(page). to have_content 'Impressum'

		click_link "Kontakt"
		expect(page).to have_title(full_title('Kontakt'))
		expect(page). to have_content 'Kontakt'		
	end

	describe "should have the correct paths set" do
		it do
			visit impressum_path
			expect(page).to have_title(full_title('Impressum'))
			expect(page). to have_content 'Impressum'
		end

		it do
			visit kontakt_path
			expect(page).to have_title(full_title('Kontakt'))
			expect(page). to have_content 'Kontakt'
		end

		it do
			visit hilfe_path
			expect(page).to have_title(full_title('Hilfe'))
			expect(page). to have_content 'Hilfe'
		end
	end
end