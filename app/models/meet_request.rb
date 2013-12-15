class MeetRequest < ActiveRecord::Base

	belongs_to :sender, class_name: "User", foreign_key: "sender_id", primary_key: "sender_id"
	belongs_to :receiver, class_name: "User", foreign_key: "receiver_id", primary_key: "sender_id"


	def self.confirm_meetup(user, friend)
		friend1 = find_by_sender_id_and_receiver_id(user.sender_id, friend.receiver_id)
		friend2 = find_by_sender_id_and_receiver_id(friend.receiver_id, user.sender_id)
		if friend1.nil? && friend2.nil?
			return false
		else
			transaction do
				friend1.update_attributes(meetup_confirmation: true)
				# friend2.update_attributes(meetup_confirmation: true)
			end
		end
	end

end
