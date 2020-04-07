class TourGuide::OrdersController < ApplicationController

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

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to edit_tour_guide_order_path(@order)
    end
  end

  private
  def order_params
    params.require(:order).permit(:status)
  end
end

