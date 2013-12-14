class MeetRequestsController < ApplicationController
	
	def index
	 # if params[:mailbox] == "sent"
		#  @meet_requests = @user.sent_messages
	 # elsif params[:mailbox] == "inbox"
		 @meet_requests = current_user.received_requests
		#  #elsif params[:mailbox] == "archieved"
		#  # @meet_requests = @user.archived_messages
	 # end
	end

	def new
	 @meet_request = MeetRequest.new
	 if params[:reply_to]
		 @reply_to = User.find_by_user_id(params[:reply_to])
	 unless @reply_to.nil?
		 @meet_request.receiver_id = @reply_to.user_id
	 end
	end
  end

	def create
		@meet_request = MeetRequest.new(params[:meet_request].permit(:option, :message))
		# @meet_request = current_user.sent_requests.build(receiver_id: params[:receiver_id])
		@meet_request.sender_id = current_user.id
		if @meet_request.save
			flash[:notice] = "Request Sent!"
			redirect_to current_user
		else
			flash[:error] = "Request Failed. Try Again."
			redirect_to @friendship
		end
	end
end