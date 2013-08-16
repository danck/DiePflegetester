FactoryGirl.define do
	factory :user do
		name		"Manfred Wurst"
		email		"test@test.test"
		password	"foobar"
		password_confirmation "foobar"
		role		"benutzer"
		nicname		"Wurst"
	end
	
	factory :user2, class: :user do
		name		"Manfred Wurst2"
		email		"test2@test.test"
		password	"foobar2"
		password_confirmation "foobar2"
		role		"benutzer"
		nicname		"Wurst2"
	end
end