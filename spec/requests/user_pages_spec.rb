require 'spec_helper'

describe "UserPages" do
	subject { page }
	before { visit registrieren_path }

	it { should have_title full_title('Registrieren')}
	it { should have_content 'Konto'}
end
