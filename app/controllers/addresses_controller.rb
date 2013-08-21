class AddressesController < ApplicationController
	before_action :signed_in_user,  only: [:edit, :update, :index, :destroy]
	before_action :correct_user,    only: [:edit, :update]
	before_action :admin_user,      only: [:index, :destroy]

	def new
		@address = Address.new
	end

	def create
		zipcode = Zipcode.find_by_code(params[:zipcode])
		if zipcode && zipcode.valid?
			address = Adress.new(address_params, zipcode_id: zipcode.id)
			if address.save
			else
				render 'new'
			end
		else
			# handle invalid zipcode
		end
	end

	private

		def address_params
			params.require(:address).permit(
				:street, :number)
		end

	    # Before Filters

	    def signed_in_user
	      unless helper_signed_in?
	        flash[:notice] = "Bitte anmelden"
	        helper_store_location
	        redirect_to anmelden_url # , notice: "bitte anmelden"
	      end
	    end

	    def correct_user
	    	# TODO: make sure the user is related to the associated entry
	    end

	    def admin_user
	      redirect_to root_url unless helper_current_user.role == 'admin'
	    end
end