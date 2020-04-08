class Tourist::OrdersController < ApplicationController

  def new
  	@tour = Tour.find_by(id: params[:tour_id])
  	@order = Order.new
  end


  def confirm
  	@order = Order.new(order_params)
  	 if order_params[:companion] += 1 > @order.capacity
      redirect_to new_tourist_order_path
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
      params.require(:order).permit(:tourist_id, :tour_id, :guide_id, :tour_title, :tour_body, :price, :contents_of_price, :capacity, :companion, :total_people, :tour_time, :tour_city)
  end
end
