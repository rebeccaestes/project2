class ConcertsController < ApplicationController

	# before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
	# before_action :set_post, only: [:show, :edit, :update, :destroy]

	def index
		@concerts = Concert.all.order(:date)
		@attendances = current_user.attendances
	end

	def new
		# @user = current_user
		@concert = Concert.new
		@venues = Venue.all
	end

	def show 
		@concert = Concert.find(params[:id])
	end

	def create
		# @user = current_user
		@concert = Concert.create!(concert_params)
		redirect_to concert_path(@concert)
	end

	def edit
		@concert = Concert.find(params[:id])
		@venue = @concert.venue
		@venues = Venue.all		
	end

	def update
		@concert = Concert.find(params[:id])
		@concert.update(concert_params)
		redirect_to concert_path(@concert)
	end

	def destroy
		@concert = Concert.find(params[:id])
		@concert.destroy
		redirect_to concerts_path
	end

	def add_attendance
		@concert = Concert.find(params[:id])
		@user = current_user
		@concert.attendances.create(user: @user)
		redirect_to concert_path(@concert)
	end

	def remove_attendance
		@concert = Concert.find(params[:id])
		@user = current_user
		@concert.attendances.where(user_id = @user).destroy_all
		# @user.attendances.where(concert_id = @concert).destroy_all
		redirect_to concert_path(@concert)
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