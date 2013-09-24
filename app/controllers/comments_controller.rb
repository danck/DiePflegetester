class CommentsController < ApplicationController
	before_action :signed_in_user,  only: [:create, :edit, :update, :destroy]

	include SessionsHelper

	def new
  		@comment = Comment.new
	end

	def create
	    @comment = Comment.new(comment_params)
	    @comment.user_id = helper_current_user.id
	    if @comment.save
			  flash[:success] = "Kommentar eingetragen".html_safe
			  redirect_to Anbieter.find(params[:comment][:anbieter_id])
	    else
			  flash[:error] = "Fehler</i>".html_safe
			  render 'new'
	    end
	end

	private

		def signed_in_user
      		unless helper_signed_in?
		        flash[:notice] = "Bitte anmelden"
		        helper_store_location
		        redirect_to anmelden_url # , notice: "bitte anmelden"
    	end

    	def comment_params
	    	if params[:comment] != nil
	        	if @current_user

	  		    	params.require(:comment).permit(
	  					:anbieter_id, :body)
	        	else
	          		params.require(:comment).permit(
	          			:anbieter_id, :body)
	        	end
	      	end
    	end
    end
end
