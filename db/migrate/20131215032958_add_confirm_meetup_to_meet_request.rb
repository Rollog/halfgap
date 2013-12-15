class AddConfirmMeetupToMeetRequest < ActiveRecord::Migration
  def change
    add_column :meet_requests, :confirm_meetup, :boolean
  end
end
