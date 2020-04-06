class TourGuide::HomeController < ApplicationController
  def top
  	@orders = current_guide.orders
  end

  def about
  end
end
