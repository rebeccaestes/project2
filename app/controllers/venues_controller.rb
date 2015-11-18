class VenuesController < ApplicationController

	# before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
	# before_action :set_post, only: [:show, :edit, :update, :destroy]

	def index
		@venues = Venue.all
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
		if params[:concert_id]
			redirect_to edit_concert_path(params[:concert_id]), notice: "Venue added! Now you can select it below."
		else
			redirect_to new_concert_path, notice: "Venue added! Now you can select it below."
		end
	end

	def edit
		@venue = Venue.find(params[:id])
		@concert = Concert.first
	end

	def update
		@venue = Venue.find(params[:id])
		@venue.update(venue_params)
		if params[:concert_id]
			redirect_to edit_concert_path(params[:concert_id]), notice: "Venue updated!"
		else
			redirect_to new_concert_path, notice: "Venue updated!"
		end
	end

	def destroy
		@venue = Venue.find(params[:id])
		@venue.destroy
		redirect_to concerts_path, notice: "Venue deleted."
	end

	private
	def venue_params
		params.require(:venue).permit( 
			:name,
			:url,
			:city )
	end
end