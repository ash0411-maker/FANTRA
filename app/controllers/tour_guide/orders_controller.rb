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
  end
end

