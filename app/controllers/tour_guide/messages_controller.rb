class TourGuide::MessagesController < ApplicationController
  def create
  	@room = Room.find(params[:room_id])
    @message = Message.new(message_params)
    #メッセージがguideによるものだったらis_tourist = false
    @message.is_tourist = false
    @message.room_id = @room.id
    if @message.save
      redirect_to tour_guide_guide_room_path(current_guide, @room)
    else
      flash[:warning] = "メッセージを入力してください"
      redirect_to tour_guide_guide_room_path(current_guide, @room)
    end
  end

  private
  def message_params
    params.require(:message).permit(:content)
  end
end

