namespace :db do
	desc "Fill with sample data"
	task populate: :environment do
		User.create!(name: "Example User",
			email: "bl@example.com",
			nicname: "bla",
			password: "foobar",
			password_confirmation: "foobar",
			role: 'admin')
		99.times do |n|
			name 		= Faker::Name.name
			nicname		= name + n.to_s
			email		= "bl#{n+1}@example.com"
			password 	= "foobar"
			User.create!(name: name,
				email: email,
				nicname: nicname,
				password: password,
				password_confirmation: password)
		end
		Anbieter.create!(name: "Beispiel Anbieter")
		99.times do |n|
			name 	= "Anbieter: " + Faker::Name.name
			Anbieter.create!(name: name)
		end
	end
end