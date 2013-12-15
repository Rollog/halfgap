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
 		@meet_request.sender_id = current_user.id
		@meet_request.receiver_id = @friend.id
 	end

	def create
		@friendship = current_user.friendships.find_by(params[:id])
		@friend = current_user.friends.find_by(params[:id])

		@meet_request = current_user.sent_requests.new(meet_requests_params)
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
		# meet_conf = params[:meetup_confirmation]
		@user = current_user.received_requests.find(params[:id])
		@friend = MeetRequest.find_by_sender_id(params[:sender_id])
		if MeetRequest.confirm_meetup(@user, @friend)
			flash[:notice] = "Confirmed request!"
			redirect_to :back
		end
		# render json: { meetup_confirmation: meet_conf }
	end

	private

	def meet_requests_params
		params.require(:meet_request).permit(:option, :message)
	end

end
