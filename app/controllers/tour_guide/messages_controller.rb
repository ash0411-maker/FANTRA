class TourGuide::MessagesController < ApplicationController

  before_action :authenticate_guide!, only: [:create]
  before_action :correct_guide, only: [:create]

  def create
  	@room = Room.find(params[:room_id])
    @message = Message.new(message_params)
    #メッセージがguideによるものだったらis_tourist = false
    @message.is_tourist = false
    @message.room_id = @room.id
    if @message.save
  # ------- 通知機能 --------
      save_notice_chat!(@message.id, @room.tourist.id, @room.id)
  # ------- 通知機能 --------
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

  def correct_guide
    guide = Guide.find(params[:guide_id])
    if current_guide != guide
      redirect_to tour_guide_guide_path(current_guide)
    end
  end


  def save_notice_chat!(message_id, tourist_id, room_id)
      notice = current_guide.guide_active_notices.new(
        visitor_id: current_guide.id,
        visited_id: tourist_id,
        message_id: message_id,
        room_id: room_id
      )
      notice.save if notice.valid?
  end


end

