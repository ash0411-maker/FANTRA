class AddMeetingpointAndMeetingpointIntroductionToTours < ActiveRecord::Migration[5.2]
  def change
  	add_column :tours, :meetingpoint_address, :string
  	add_column :tours, :meetingpoint_introduction, :string
  	add_column :tours, :latitude, :float
    add_column :tours, :longitude, :float
  end
end
