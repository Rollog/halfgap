class MeetRequestsController < ApplicationController
	
	def index
		@meet_requests = current_user.received_requests
	end

	# def new
	# @friendship = current_user.friendships.friend.find(params[:id])
	# @meet_request = @friendship.meet_requests.new
	#  if params[:reply_to]
	# 	 @reply_to = User.find_by_user_id(params[:reply_to])
	# 	 unless @reply_to.nil?
	# 		 @meet_request.receiver_id = @reply_to.user_id
	# 	 end
	# 	end
 #  end

 	def new
 		@meet_request = current_user.sent_requests.new
 		@friend = current_user.friends.find_by(params[:id])
 	end

	def create
		@friend = current_user.friends.find_by(params[:id])

		@meet_request = current_user.sent_requests.new(meet_requests_params)
		# to make sure we are sending storing to whom the req is being sent
		@meet_request.receiver_id = @friend.id
		if @meet_request.save
			flash[:notice] = "Request Sent!"
			redirect_to current_user
		else
			flash[:error] = "Request Failed. Try Again."
			redirect_to @friendship
		end
	end

	def confirm_meetup
		@received_request = current_user.received_requests.find_by(params[:receiver_id])
		@received_request.update_attributes(meetup_confirmation: true)
		redirect_to :back
	end

	private

	def meet_requests_params
		params.require(:meet_request).permit(:option, :message)
	end

end
