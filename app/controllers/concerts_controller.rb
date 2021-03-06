class ConcertsController < ApplicationController

	before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy, :yourcal]

	def filter_cities (selected_city)
		@selected_concerts = []
		@all_concerts.each do |concert|
			if selected_city == concert.venue.city
				@selected_concerts.push(concert)
			end
		end
		return @selected_concerts
	end

	def index
		@all_concerts = Concert.all.order(:date)
		@concerts = Concert.all.order(:date)
		if params[:city] == 'all'
			@concerts = Concert.all.order(:date)
		elsif params[:city]
			@concerts = filter_cities (params[:city])
		end
		if current_user
			@attendances = current_user.attendances
		end
	end

	def new
		@user = current_user
		@concert = Concert.new
		@venues = Venue.all
	end

	def show
		@concert = Concert.find(params[:id])
		@attendances = Attendance.all
		@owner = @concert.user
	end

	def create
		@user = current_user
		@concert = Concert.create!(concert_params.merge(user: @user))
		redirect_to concert_path(@concert), notice: "Concert created!"
	end

	def edit
		@concert = Concert.find(params[:id])
		@owner = @concert.user
		@venue = @concert.venue
		@venues = Venue.all
		@venue_concerts = @venue.concerts
	end

	def update
		@user = current_user
		@concert = Concert.find(params[:id])
		@concert.update(concert_params.merge(user: @user))
		redirect_to concert_path(@concert), notice: "Concert updated!"
	end

	def destroy
		@concert = Concert.find(params[:id])
		@concert.destroy
		@concert.attendances.destroy_all
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
			:venue_id,
			:user_id )
	end
end
