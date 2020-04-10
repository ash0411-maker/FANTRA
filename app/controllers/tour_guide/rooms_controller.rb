class TourGuide::RoomsController < ApplicationController

  def index
    @rooms = current_guide.rooms
  end

  def show
  	@room = Room.find(params[:id]) #ルーム情報の取得
    @message = Message.new #新規メッセージ投稿
    @messages = @room.messages #このルームのメッセージを全て取得
    if @room.guide.id == current_guide.id
    	@tourist = @room.tourist
    else
    	redirect_to root_path
    end
  end

  def create
    if guide_signed_in?
      #ガイドがログインしてたらguide_idを@roomにいれる
      @room = Room.new(room_tourist_params)
      @room.guide_id = current_guide.id
    else
      redirect_to root_path
    end

    if @room.save
      redirect_to tour_guide_room_path(@room)
    else
      redirect_to root_path
    end
  end




  private
  def room_tourist_params
    params.require(:room).permit(:toursit_id)
  end


end
