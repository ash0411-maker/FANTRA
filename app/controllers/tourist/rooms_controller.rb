class Tourist::RoomsController < ApplicationController

  def show
  	@room = Room.find(params[:id]) #ルーム情報の取得
    @message = Message.new #新規メッセージ投稿
    @messages = @room.messages #このルームのメッセージを全て取得
    if @room.tourist.id == current_tourist.id
      @guide = @room.guide.name
    else
      redirect_to tourist_tourist_path(current_tourist)
    end
  end

  def create
    @room = Room.new(room_guide_params)
    @room.tourist_id = current_tourist.id
    if @room.save
      redirect_to tourist_room_path(@room)
    else
      redirect_to tourist_tourist_path(current_tourist)
    end
  end


  private
  def room_guide_params
    params.require(:room).permit(:guide_id)
  end

end
