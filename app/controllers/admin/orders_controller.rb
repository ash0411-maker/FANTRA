class Admin::OrdersController < ApplicationController

  def index
  	@orders = Order.all
  	admin_sales = []
  	@orders.each do |order|
  		admin_sales << order.price * 0.12
  	end
  	@admin_sales = admin_sales.sum
  end

  def show
  end
end
