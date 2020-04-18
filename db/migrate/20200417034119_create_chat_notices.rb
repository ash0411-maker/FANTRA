class CreateChatNotices < ActiveRecord::Migration[5.2]
  def change
    create_table :chat_notices do |t|
      t.integer :visitor_id, null: false
      t.integer :visited_id, null: false
      t.boolean :checked, default: false, null: false
      t.integer :message_id, null: false

      t.timestamps
    end
  end
end
