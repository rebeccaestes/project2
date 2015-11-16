class ConcertsController < ApplicationController

	# before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
	# before_action :set_post, only: [:show, :edit, :update, :destroy]

	def index
		@concerts = Concert.all
	end

	def new
		# @user = current_user
		@concert = Concert.new
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
	end

	def update
		@concert = Concert.find(params[:id])
		@concert.update(concert_params)
		redirect_to concert_path(@concert)
	end

	def destroy
		@concert.destroy
		redirect_to concerts_path
	end

	private
	def concert_params
		params.require(:concert).permit(:venue, 
			:city, 
			:date, 
			:headliner, 
			:headliner_pic,
			:headliner_url,
			:openers_etc,
			:buy,
			:price )
	end
end