class MeetRequest < ActiveRecord::Base
	belongs_to :sender, class_name: "User", foreign_key: "sender_id"
	belongs_to :receiver, class_name: "User", foreign_key: "receiver_id"


	def self.confirm_request
		request = find_by_sender_id_and_receiver_id(user.sender_id, friend.receiver_id)
		if request.nil?
			return false
		else
			transaction do
				f1.update_attributes(confirm_request: true)
			end
		end
	end


end
