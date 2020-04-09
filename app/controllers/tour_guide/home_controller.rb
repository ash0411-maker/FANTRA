class TourGuide::HomeController < ApplicationController
  def top
  	@orders = current_guide.orders
  end

  def about
  	@tours = Tour.all
  end
end
