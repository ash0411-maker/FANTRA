class Tourist::MessagesController < ApplicationController
	def create
    @room = Room.find(params[:room_id])
    @message = Message.new(message_params)
    #メッセージがtouristによるものだったらis_tourist = true, guideによるものだったらis_tourist = guide
    @message.is_tourist = true
    @message.room_id = @room.id
    if @message.save
      redirect_to tourist_room_path(@room)
    else
      redirect_to tourist_room_path(@room)
    end
  end

  private
  def message_params
    params.require(:message).permit(:content)
  end
end
