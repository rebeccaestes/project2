class ConcertsController < ApplicationController

	before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy, :yourcal]
	# before_action :set_post, only: [:show, :edit, :update, :destroy]

	def index
		@concerts = Concert.all.order(:date)
		if current_user
			@attendances = current_user.attendances
		end
	end

	def new
		# @user = current_user
		@concert = Concert.new
		@venues = Venue.all
	end

	def show 
		@concert = Concert.find(params[:id])
		@attendances = Attendance.all
	end

	def create
		# @user = current_user
		@concert = Concert.create!(concert_params)
		redirect_to concert_path(@concert), notice: "Concert created!"
	end

	def edit
		@concert = Concert.find(params[:id])
		@venue = @concert.venue
		@venues = Venue.all
		@venue_concerts = @venue.concerts
	end

	def update
		@concert = Concert.find(params[:id])
		@concert.update(concert_params)
		redirect_to concert_path(@concert), notice: "Concert updated!"
	end

	def destroy
		@concert = Concert.find(params[:id])
		@concert.destroy
		redirect_to concerts_path, notice: "Concert deleted!"
	end

	def yourcal
		@concerts = Concert.all.order(:date)
		@attendances = current_user.attendances
	end

	def add_attendance
		@concert = Concert.find(params[:id])
		@user = current_user
		@concert.attendances.create(user: @user)
		redirect_to concert_path(@concert), notice: "See you there!"
	end

	def remove_attendance
		@concert = Concert.find(params[:id])
		@user = current_user
		@concert.attendances.where(user: @user).destroy_all
		redirect_to concert_path(@concert), notice: "Got it. Maybe next time?"
	end

	private
	def concert_params
		params.require(:concert).permit( 
			:date, 
			:headliner, 
			:headliner_pic,
			:headliner_url,
			:openers_etc,
			:buy,
			:price,
			:venue_id )
	end
end