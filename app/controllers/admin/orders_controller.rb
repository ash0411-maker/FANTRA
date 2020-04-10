class Admin::OrdersController < ApplicationController

  def today
    @orders = Order.where(created_at: Time.zone.now.all_day)
    admin_total_sales = []
    @orders.each do |order|
      admin_total_sales << order.admin_sales
    end
    @admin_total_sales = admin_total_sales.sum
  end

  def index
  	@orders = Order.all
  	admin_total_sales = []
  	@orders.each do |order|
  		admin_total_sales << order.admin_sales
  	end
  	@admin_total_sales = admin_total_sales.sum
  end

  def show
    @order = Order.find(params[:id])
  end

end
