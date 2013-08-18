def full_title page_title
	base_title = "Die Pflegetester"
	if page_title.empty?
		base_title
	else
		"#{base_title} | #{page_title}"
	end
end

def sign_in(user, options={})
	if options[:no_capybara]
		# Sign-in does not work as below with Capybara, so:
		remember_token = User.new_remember_token
		cookies[:remember_token] = remember_token
		user.update_attribute(:remember_token, User.encrypt(remember_token))
	else
		visit anmelden_path
		fill_in "email", 	with: user.email
		fill_in "password", with: user.password
		click_button "Anmelden"
	end
end