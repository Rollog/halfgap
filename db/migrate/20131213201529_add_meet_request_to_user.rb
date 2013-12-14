class AddMeetRequestToUser < ActiveRecord::Migration
  def change
    add_column :users, :meet_request, :boolean
  end
end
