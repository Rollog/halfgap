class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id])
    if @friendship.save
      flash[:notice] = "Added friend."
      redirect_to users_path
    else
      flash[:error] = "Unable to add friend."
      redirect_to users_path
    end
  end

  def show
    @friendship = current_user.friends.find(params[:id])

    # @meet_request = current_user.friendships.build(receiver_id: params[:receiver_id])
    # @meet_request.sender_id = @user.user_id
    # @meet_request.save
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    flash[:notice] = "Removed friendship."
    redirect_to current_user
  end
end
