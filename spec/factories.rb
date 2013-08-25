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

	factory :admin, class: :user do
		name		"Anton Admin"
		email		"admin@test.test"
		password	"foobar2"
		password_confirmation "foobar2"
		role		"admin"
		nicname		"Aderminiristrator"		
	end

	factory :users, class: :user do
		sequence(:name)		{ |n| "Person #{n}"}
		sequence(:email)	{ |n| "person_#{n}@example.com" }
		sequence(:nicname)	{ |n| "person#{n}"}
		password "foobar"
		password_confirmation "foobar"
	end

	factory :zipcodes, class: :zipcode do
		sequence(:code)		{ |n| 10000 + n }
	end

	factory :zipcode do
		code		12345
	end

	factory :addresses, class: :address do
		sequence(:street)	{ |n| "Bla#{n}street"}
		sequence(:street_number)
		association :zipcode, :factory => :zipcodes
		# zipcode_id 12
	end

	factory :address do
		street 			"blaStreet"
		street_number	"12a"
		association :zipcode_id, factory: :zipcode
	end

	factory :contact_data do

	end

	factory :anbieter do
		name 		"Testanbieter"
	end
end