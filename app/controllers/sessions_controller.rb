class SessionsController < ApplicationController
	include SessionsHelper
	def new

	end

	def create
		@user = User.find_by(email: params[:session][:email].downcase)
		if @user && @user.authenticate(params[:session][:password])
			helper_sign_in @user
			redirect_to @user
		else
			flash.now[:danger] = 'Email oder Passwort falsch'
			render 'new'
		end
	end

	def destroy
	end
end