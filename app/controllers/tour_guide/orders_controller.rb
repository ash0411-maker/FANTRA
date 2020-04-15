class TourGuide::OrdersController < ApplicationController

  before_action :authenticate_guide!
  before_action :correct_guide, only: [:index, :update]


  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to tour_guide_guide_orders_path(current_guide)
    end
  end

  def index
    @orders = current_guide.orders
    guide_total_sales = []
    @orders.each do |order|
      guide_total_sales << order.guide_sales
    end
    @guide_total_sales = guide_total_sales.sum
    @guide_total_sales = @guide_total_sales.floor
  end


# -------------- 予約ステータス変更ページ --------------
  def new_order
    @orders = current_guide.orders
    guide_total_sales = []
    @orders.each do |order|
      guide_total_sales << order.guide_sales
    end
    @guide_total_sales = guide_total_sales.sum
    @guide_total_sales = @guide_total_sales.floor

    rooms = current_guide.rooms
    @tourist_ids = []
    rooms.each do |room|
      @tourist_ids << room.tourist_id
    end
  end


  def around_touring
    @orders = current_guide.orders
    guide_total_sales = []
    @orders.each do |order|
      guide_total_sales << order.guide_sales
    end
    @guide_total_sales = guide_total_sales.sum
    @guide_total_sales = @guide_total_sales.floor

    rooms = current_guide.rooms
    @tourist_ids = []
    rooms.each do |room|
      @tourist_ids << room.tourist_id
    end
  end

  def finished_tour
    @orders = current_guide.orders
    guide_total_sales = []
    @orders.each do |order|
      guide_total_sales << order.guide_sales
    end
    @guide_total_sales = guide_total_sales.sum
    @guide_total_sales = @guide_total_sales.floor

    rooms = current_guide.rooms
    @tourist_ids = []
    rooms.each do |room|
      @tourist_ids << room.tourist_id
    end
  end

# -------------- 予約ステータス変更ページ --------------



  private
  def order_params
    params.require(:order).permit(:status)
  end

  def correct_guide
    guide = Guide.find(params[:guide_id])
    if current_guide != guide
      redirect_to tour_guide_guide_path(current_guide)
    end
  end
end

