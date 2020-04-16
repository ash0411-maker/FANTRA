class RemoveVisitorIdAndVisitedIdToNotifications < ActiveRecord::Migration[5.2]
  def change
  	remove_column :notifications, :visitor_id, :integer
  	remove_column :notifications, :visited_id, :integer
  end
end
