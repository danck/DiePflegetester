module SessionsHelper

	# creates a secure remember token and stores in as user's cookie and in database
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

	# returns current user
	def helper_current_user
		remember_token = User.encrypt(cookies[:remember_token])
		@current_user ||= User.find_by(remember_token: remember_token)
	end

	def helper_current_user?(user)
		user == helper_current_user
	end

	def helper_sign_out
		@current_user = nil
		cookies.delete(:remember_token)
	end

	def helper_redirect_back_or(default)
		redirect_to(session[:return_to] || default)
		session.delete(:return_to)
	end

	# stores actual request
	def helper_store_location
		session[:return_to] = request.url
		# puts request.inspect
	end

	def signed_in_user
      unless helper_signed_in?
        flash[:notice] = "Bitte anmelden"
        helper_store_location
        redirect_to anmelden_url # , notice: "bitte anmelden"
      end
    end

    # inflexible convenience method to quick-check for admins
    def admin_user
      redirect_to root_url unless helper_current_user.role == 'admin'
    end
end