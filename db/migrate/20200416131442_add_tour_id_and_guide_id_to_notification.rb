class AddTourIdAndGuideIdToNotification < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications, :tourist_id, :integer
    add_column :notifications, :guide_id, :integer
  end
end
