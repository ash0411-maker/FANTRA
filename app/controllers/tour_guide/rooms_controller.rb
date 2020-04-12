class TourGuide::RoomsController < ApplicationController

  before_action :authenticate_guide!, only: [:show, :edit, :update, :destroy]
  before_action :correct_guide, only: [:show, :index, :create]


  def index
    @rooms = current_guide.rooms.page(params[:page]).per(10)
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
    @room = Room.new(room_tourist_params)
    @room.guide_id = current_guide.id
    if @room.save
      redirect_to tour_guide_guide_room_path(current_guide, @room)
    else
      redirect_to tour_guide_guide_orders_path(current_guide)
    end
  end


  private
  def room_tourist_params
    params.require(:room).permit(:tourist_id)
  end


  def correct_guide
    guide = Guide.find(params[:guide_id])
    if current_guide != guide
      redirect_to tour_guide_guide_path(current_guide)
    end
  end






end



