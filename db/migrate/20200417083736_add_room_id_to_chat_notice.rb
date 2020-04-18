class AddRoomIdToChatNotice < ActiveRecord::Migration[5.2]
  def change
    add_column :chat_notices, :room_id, :integer
  end
end
