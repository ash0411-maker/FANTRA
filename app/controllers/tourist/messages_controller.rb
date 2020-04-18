class Tourist::MessagesController < ApplicationController

  before_action :authenticate_tourist!
  before_action :correct_tourist, only: [:create]

	def create
    @room = Room.find(params[:room_id])
    @message = Message.new(message_params)
    #メッセージがtouristによるものだったらis_tourist = true, guideによるものだったらis_tourist = false
    @message.is_tourist = true
    @message.room_id = @room.id
    if @message.save
      save_notice_chat!(@message.id, @room.guide.id, @room.id)
      redirect_to tourist_tourist_room_path(current_tourist, @room)
    else
      flash[:warning] = "メッセージを入力してください"
      redirect_to tourist_tourist_room_path(current_tourist, @room)
    end
  end



  private
  def message_params
    params.require(:message).permit(:content)
  end

  def correct_tourist
    tourist = Tourist.find(params[:tourist_id])
    if current_tourist != tourist
      redirect_to tourist_tourist_path(current_tourist)
    end
  end

  def save_notice_chat!(message_id, guide_id, room_id)
      notice = current_tourist.tourist_active_notices.new(
        visitor_id: current_tourist.id,
        visited_id: guide_id,
        message_id: message_id,
        room_id: room_id
      )
      notice.save if notice.valid?
  end

end
