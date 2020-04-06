class Tourist::TouristsController < ApplicationController
  def show
  	@orders = current_tourist.orders
  end

  def edit
  end
end
