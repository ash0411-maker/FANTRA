class TourGuide::OrdersController < ApplicationController
  before_action :authenticate_guide!


  def index
  	@orders = current_guide.orders
  	guide_total_sales = []
  	@orders.each do |order|
  		guide_total_sales << order.guide_sales
  	end
  	@guide_total_sales = guide_total_sales.sum
  	@guide_total_sales = @guide_total_sales.floor

    #自分が入ってるroomの相手のidを格納する
    rooms = current_guide.rooms
    @tourist_ids = []
    rooms.each do |room|
      @tourist_ids << room.tousit_id
    end
  end


  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to tour_guide_orders_path
    end
  end



  private
  def order_params
    params.require(:order).permit(:status)
  end
end

