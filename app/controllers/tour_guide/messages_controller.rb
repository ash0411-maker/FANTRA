class TourGuide::MessagesController < ApplicationController
  def create
  	@room = Room.find(params[:room_id])
    @message = Message.new(message_params)
    #メッセージがguideによるものだったらis_tourist = false
    @message.is_tourist = false
    @message.room_id = @room.id
    if @message.save
      redirect_to tour_guide_room_path(@room)
    else
      redirect_to tour_guide_room_path(@room)
    end
  end

  private
  def message_params
    params.require(:message).permit(:content)
  end
end

