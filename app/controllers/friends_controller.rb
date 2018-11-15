class FriendsController < ApplicationController
  before_action :set_friend, only: :destroy

  def index
  	@friends = current_user.friends

    @incomings = FriendRequest.where(friend: current_user)
    @outgoings = current_user.friend_requests
  end

  def destroy
	  current_user.remove_friend(@friend)
    # head :no_content
    redirect_to friends_index_path
  end


private
  def set_friend
    @friend = current_user.friends.find(params[:id])
  end

end
