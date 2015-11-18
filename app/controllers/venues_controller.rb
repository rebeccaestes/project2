class VenuesController < ApplicationController

	# before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
	# before_action :set_post, only: [:show, :edit, :update, :destroy]

	def index
		@venues = Venue.all
		@concerts = Concert.all
		# @attendances = Attendance.all
	end

	def new
		@concert = Concert.find(params[:concert_id])
		# @user = current_user
		@venue = Venue.new
		# @prev_url = request.referer
	end

	def create
		# @user = current_user
		@venue = Venue.create!(venue_params)
		redirect_to edit_concert_path(params[:concert_id]), notice: "Venue added! Now you can select it below."
	end

	def edit
		@venue = Venue.find(params[:id])
		@concert = Concert.last
	end

	def update
		@venue = Venue.find(params[:id])
		@venue.update(venue_params)
		redirect_to edit_concert_path(params[:concert_id]), notice: "Venue updated!"
	end

	def destroy
		@venue = Venue.find(params[:id])
		@venue.destroy
		redirect_to concert_venues_path(1), notice: "Request completed, administrative overlord."
	end

	private
	def venue_params
		params.require(:venue).permit( 
			:name,
			:url,
			:city )
	end
end