class Tourist::MessagesController < ApplicationController

  # before_action :correct_tourist, only: [:create]

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

  # def correct_tourist
  #   tourist = Tourist.find_by(id: session[:tourist_id])
  #   if current_tourist =! tourist
  #     redirect_to tourist_tourist_path(current_tourist)
  #   end
  # end
end
