require 'spec_helper'

describe "Pflegeberater pages" do
	subject { page }

	describe "for non-signed-in users" do
		describe "index" do
			before { visit pflegeberater_path }

			it { should_not have_title 'Liste der Pflegeberater' }
		end
	end
end