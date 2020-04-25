class TourGuide::HomeController < ApplicationController

  before_action :authenticate_guide!, only: [:top]

  def top
  	@orders = current_guide.orders.where(created_at: Time.zone.now.all_day)
  end

  def about
  	@tours = Tour.order("RANDOM()").all.page(params[:page]).per(9)
  end

  def window
  	@tour = Tour.find(params[:tour_id])
  	@tour_photos = @tour.tour_photos
    @comments = @tour.comments
  end

end



