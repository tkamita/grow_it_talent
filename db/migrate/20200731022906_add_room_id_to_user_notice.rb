class AddRoomIdToUserNotice < ActiveRecord::Migration[5.2]
  def change
    add_column :user_notices, :room_id, :integer
  end
end
