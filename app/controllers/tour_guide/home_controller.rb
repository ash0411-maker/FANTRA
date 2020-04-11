class TourGuide::HomeController < ApplicationController
  def top
  	@orders = current_guide.orders
  end

  def about
  	@tours = Tour.all.page(params[:page]).per(4)
  end
end
