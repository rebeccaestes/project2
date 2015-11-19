class FriendshipsController < ApplicationController
def create
  @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
  if @friendship.save
    flash[:notice] = "Added friend."
  else
    friend = @friendship.friend
    flash[:error] = "Issues adding #{friend.email}: #{@friendship.errors.full_messages}"
  end
  redirect_to users_path
end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    flash[:notice] = "Removed friendship."
    redirect_to users_path
  end
end
