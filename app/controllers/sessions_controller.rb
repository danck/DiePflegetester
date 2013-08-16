class SessionsController < ApplicationController
	include SessionsHelper
	def new

	end

	def create
		@user = User.find_by(email: params[:email].downcase)
		if @user && @user.authenticate(params[:password])
			helper_sign_in @user
			redirect_to @user
		else
			flash.now[:danger] = 'Email oder Passwort falsch'
			render 'new'
		end
	end

	def destroy
		helper_sign_out
		redirect_to root_url
	end
end