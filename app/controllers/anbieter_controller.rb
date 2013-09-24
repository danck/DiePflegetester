class AnbieterController < ApplicationController
	before_action :signed_in_user,  only: [:new, :create, :edit, :update, :index, :destroy]
  	before_action :correct_user,    only: [:edit, :update, :destroy]
  	before_action :admin_user,      only: [:index, :destroy]

	include SessionsHelper
	include InputHelper

	def new
		@anbieter = Anbieter.new
	end

	def create
	    @anbieter = Anbieter.new(anbieter_params)
	    if @anbieter.save
			  flash[:success] = "#{@anbieter.name} wurde eingetragen".html_safe
			  redirect_to @anbieter
	    else
			  flash[:error] = "Fehler</i>".html_safe
			  render 'new'
	    end		
	end

	def show
		@anbieter = Anbieter.find(params[:id].to_i)
		if @anbieter
			@comments = @anbieter.comments.paginate(page: params[:page], per_page: 10).order('created_at DESC')
		end
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


	def suche
	    if Anbieter.any?
		    @anbieter = Anbieter.paginate(page: params[:page], per_page: 20)
	    else
	    	flash.now[:error] = "Keine Anbieter gefunden"
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

	    def anbieter_params
	    	if zipcode = Zipcode.where(code: make_safe_for(:html,params[:anbieter][:zipcode])).first
	    		params[:anbieter][:zipcode_id] = zipcode.id
	    	end	
	    	params.require(:anbieter).permit(
	        	:name, 
	        	:street, 
	        	:street_number, 
	        	:phone_number, 
	        	:city,
	        	:zipcode_id)
	  	end
end