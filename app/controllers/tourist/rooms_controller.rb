class Tourist::RoomsController < ApplicationController

  before_action :authenticate_tourist!
  before_action :correct_tourist, only: [:index, :show, :create, :destroy]

  def index
    @rooms = current_tourist.rooms.order(created_at: :desc).page(params[:page]).per(5)
  end

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
      redirect_to tourist_tourist_room_path(current_tourist, @room)
    else
      redirect_to tourist_tourist_path(current_tourist)
    end
  end


  private
  def room_guide_params
    params.require(:room).permit(:guide_id)
  end

  def correct_tourist
    tourist = Tourist.find(params[:tourist_id])
    if current_tourist != tourist
      redirect_to tourist_tourist_path(current_tourist)
    end
  end

end


