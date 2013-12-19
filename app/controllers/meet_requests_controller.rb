class MeetRequestsController < ApplicationController
	
	def index
		@enable_top_nav = true
		@received_requests = current_user.received_requests
	end

 	def new
 		@friendship = current_user.friendships.find_by(params[:id])
 		@meet_request = current_user.sent_requests.new
 		# @friendship = current_user.friendships.find(params[:id])
 		# @meet_request.receiver_id = @friendship.friend.id
 	end

	def create
		@meet_request = current_user.sent_requests.build(meet_requests_params)

		if @meet_request.save
			flash[:notice] = "Request Sent!"
			redirect_to current_user
			return
		else
			flash[:error] = "Request Failed. Try Again."
			redirect_to @friendship
		end

	end

	def confirm_meetup
		# @friendship = current_user.friendships.where(params[:friendships_id])
		@received_request = current_user.received_requests.find(params[:id])
		if @received_request.update_attributes(meetup_confirmation: true)
			redirect_to @received_request
		end
	end

	def show
		# @friend = current_user.friends.find(params[:id])
		# once a user confirms a request user is taken to map route
		@received_request = current_user.received_requests.find(params[:id])
		@friend = @received_request.sender

		# 	flash[:error] = "Meet request not confirmed!"
		# end
	end

	private

	def meet_requests_params
		params.require(:meet_request).permit(:option, :message, :receiver_id)
	end

end
