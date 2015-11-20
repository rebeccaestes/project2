class VenuesController < ApplicationController

	def index
		@venues = Venue.all
		@concerts = Concert.all
	end

	def new
		@concert = Concert.find(params[:concert_id])
		@venue = Venue.new
	end

	def create
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
