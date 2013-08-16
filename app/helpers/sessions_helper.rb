module SessionsHelper
	def helper_sign_in user
		remember_token	= User.new_remember_token
		cookies.permanent[:remember_token] = remember_token
		cookies[:remember_token] = { value:   remember_token,
                             expires: 3.months.from_now.utc }
		user.update_attribute(:remember_token, User.encrypt(remember_token))
		self.helper_current_user = user
	end

	def helper_signed_in?
		!helper_current_user.nil?
	end

	def helper_current_user= user
		@current_user = user
	end

	def helper_current_user
		remember_token = User.encrypt(cookies[:remember_token])
		@current_user ||= User.find_by(remember_token: remember_token)
	end

	def helper_sign_out
		@current_user = nil
		cookies.delete(:remember_token)
	end
end