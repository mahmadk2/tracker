class FriendshipsController < ApplicationController

def destroy

	@friendship = current_user.friendships.where(friend_id: params[:id]).first
	@friendship.destroy

	respond_to do |farmat|
		farmat.html { redirect_to my_friends_path, notice: "Friend remove successfully"}
	end
	
end

end