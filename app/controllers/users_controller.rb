class UsersController < ApplicationController
  before_action :signed_in_user, only: [:edit, :update, :show]

  include SessionsHelper

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
		  helper_sign_in @user
		  flash[:success] = "Willkommen bei <i>Die Pflegetester</i>".html_safe
		  redirect_to @user
    else
		  flash[:error] = "Fehler</i>".html_safe
		  render 'new'
    end
  end

  def index
    if @current_user && helper_current_user.role == "admin"
      # show the index
      render 'FEHLT NOCH'
    else
      # redirect and show error message
      render "FEHLT NOCH"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profil gespeichert"
      # helper_sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

  	def user_params
      if params[:user] != nil
        if @current_user && helper_current_user.role == "admin"
  		    params.require(:user).permit(
  			   :name, :email, :password, :password_confirmation, :nicname, :role)
        else
          params.require(:user).permit(
          :name, :email, :password, :password_confirmation, :nicname)
        end
      end
  	end

    # Before Filters

    def signed_in_user
      unless helper_signed_in?
        flash[:notice] = "Bitte anmelden"
        redirect_to anmelden_url, notice: "Bitte anmelden"
      end
    end
end