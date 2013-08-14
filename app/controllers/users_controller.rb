class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def show
  	@user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
  	@user.role = "Benutzer"
    if @user.save
		  # sign_in @user
		  flash[:success] = "Willkommen bei <i>Die Pflegetester</i>".html_safe
		  redirect_to @user
    else
		  # flash[:error] = "Fehler</i>".html_safe
		  render 'new'
    end
  end

  private

  	def user_params
  		params.require(:user).permit(
  			:name, :email, :password, :password_confirmation, :nicname)
  	end
end