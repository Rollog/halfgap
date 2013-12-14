class CreateMeetRequests < ActiveRecord::Migration
  def change
    create_table :meet_requests do |t|
      t.string :message
      t.integer :sender_id
      t.integer :receiver_id

      t.timestamps
    end
  end
end
