class VenuesController < ApplicationController

	# before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
	# before_action :set_post, only: [:show, :edit, :update, :destroy]

	def show
		@venues = Venue.all
	end

	def new
		# @user = current_user
		@venue = Venue.new
		# @prev_url = request.referer
	end

	def create
		# @user = current_user
		@venue = Venue.create!(venue_params)
		redirect_to @prev_url
	end

	def edit
		@venue = Venue.find(params[:id])
	end

	def update
		@venue = Venue.find(params[:id])
		@venue.update(venue_params)
		redirect_to(:back)
	end

	def destroy
		@venue = Venue.find(params[:id])
		@venue.destroy
		redirect_to concerts_path
	end

	private
	def venue_params
		params.require(:venue).permit( 
			:name,
			:directions,
			:city )
	end
end