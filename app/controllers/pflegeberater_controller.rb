class PflegeberaterController < ApplicationController
	before_action :signed_in_user,  only: [:edit, :update, :show, :index, :destroy]
	before_action :correct_user,	only: [:edit, :update]
	before_action :admin_user,		only: [:index, :destroy]

	include SessionsHelper

  def new

  end

  def create
  end

  def show
  end

  def index # Before: signed_in_user und admin_user
    @pflegeberaters = Pflegeberater.paginate(page: params[:page], per_page: 10)
  end

end