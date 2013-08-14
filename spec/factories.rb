FactoryGirl.define do
	factory :user do
		name		"Manfred Wurst"
		email		"test@test.test"
		password	"foobar"
		password_confirmation "foobar"
		role		"benutzer"
		nicname		"Wurst"
	end
end