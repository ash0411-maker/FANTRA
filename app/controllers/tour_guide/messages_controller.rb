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

end

