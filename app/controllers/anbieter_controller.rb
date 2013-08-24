class AnbieterController < ApplicationController
	before_action :signed_in_user,  only: [:edit, :update, :index, :destroy]
  	before_action :correct_user,    only: [:edit, :update, :destroy]
  	before_action :admin_user,      only: [:index, :destroy]

	include SessionsHelper

	def new
	end

	def show
		@anbieter = Anbieter.find(params[:id].to_i)
	end

	def index
		if helper_current_user.role == "admin"
			# show the index
			if Anbieter.any?
				@anbieter = Anbieter.paginate(page: params[:page], per_page: 20)
			else
				flash.now[:error] = "Keine Anbieter gefunden"
			end
		else
			# redirect and show error message
			redirect_to root_url
		end
	end

	private

    # Before Filters

    def signed_in_user
      unless helper_signed_in?
        flash[:notice] = "Bitte anmelden"
        helper_store_location
        redirect_to anmelden_url # , notice: "bitte anmelden"
      end
    end
end
