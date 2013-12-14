class AddOptionToMeetRequests < ActiveRecord::Migration
  def change
    add_column :meet_requests, :option, :string
  end
end
