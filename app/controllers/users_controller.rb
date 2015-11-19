class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    @you = current_user
    @friends = @you.friendships
  end

  def show
    @you = current_user
    @user = User.find(params[:id])
  end
end
