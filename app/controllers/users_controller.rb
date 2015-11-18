class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @users = User.all
    @user = current_user
    @friends = @user.friendships
  end

  def show
    @user = current_user
  end
end
