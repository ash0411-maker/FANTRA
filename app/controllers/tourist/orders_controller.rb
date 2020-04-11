class Tourist::OrdersController < ApplicationController

  before_action :authenticate_tourist!

  def new
  	@tourist = Tourist.find_by(id: params[:tourist_id])
    @tour = Tour.find_by(id: params[:tour_id])
  	@order = Order.new
  end


  def confirm
  	@order = Order.new(order_params)
  	if @order.companion.to_i + 1 > @order.capacity
      flash[:danger] = "定員数を超えています。"
      redirect_to new_tourist_tourist_order_path(current_tourist, tour_id: @order.tour_id)
    elsif @order.companion == ""
      redirect_to new_tourist_tourist_order_path(current_tourist, tour_id: @order.tour_id)
      flash[:danger] = "0人の場合は0とご入力ください"
    end
  	@order.total_people = @order.companion.to_i + 1
  	@total_price = @order.price * @order.total_people
  end


  def create
  	@order = Order.new(order_params)
  	@order.save
  	redirect_to tourist_orders_thanks_path
  end


  def destroy
    @order = Order.find(params[:id])
    @tourist = @order.tourist
    @order.destroy
    redirect_to tourist_tourist_path(@tourist)
  end


  def thanks
  end


  def show
  end


  private
  def order_params
      params.require(:order).permit(:tourist_id, :tour_id, :guide_id, :tour_title, :tour_body, :price, :contents_of_price, :capacity, :companion, :total_people, :tour_time, :tour_city,:admin_sales, :guide_sales, :tour_genre, :tour_price)
  end


end

