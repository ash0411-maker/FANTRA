class TourGuide::OrdersController < ApplicationController

  before_action :authenticate_guide!

  def index
  	@orders = current_guide.orders

  	order_sales = []
  	@orders.each do |order|
  		order.price *= 0.88
  		order_sales << order.price
  	end
  	order_sales = order_sales.sum
  	@order_sales = order_sales.floor
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

