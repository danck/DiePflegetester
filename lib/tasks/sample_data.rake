namespace :db do
	desc "Fill with sample data"
	task populate: :environment do
		@zipcode_pool 	= Set.new
		@user_pool 		= Set.new

		# User
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
			@user_pool << User.create!(name: name,
				email: email,
				nicname: nicname,
				password: password,
				password_confirmation: password)
		end

		# Zipcode
		rd = Random.new
		100.times do |n|
			code		= 10000 + rd.rand(89999)
			@zipcode_pool << Zipcode.create!(code: code)
		end

		# Zipcode Perimeter Table

		# Allgemeiner Anbieter
		100.times do |n|
			name 			= Faker::Company.name
			street 			= Faker::Address.street_name
			street_number	= Random.rand(180).to_s + "a"
			city			= Faker::Address.city
			phone_number	= Faker::PhoneNumber.phone_number

			anbieter = Anbieter.create!(
				name: 			name,
				street: 		street,
				street_number: 	street_number,
				city: 			city,
				phone_number: 	phone_number,
				zipcode_id: 	@zipcode_pool.to_a.sample.id)

			# Comment
			15.times do
				body		= Faker::Lorem.paragraph(sentence_count = 3)
				user 		= @user_pool.to_a.sample
				rating		= rd.rand(10) - 5
				published	= true
				validated	= false

				Comment.create!(
					body: 		body,
					user: 		user,
					anbieter: 	anbieter,
					rating: 	rating,
					published: 	published,
					validated: 	validated)
			end
		end
	end
end