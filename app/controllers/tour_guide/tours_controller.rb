class TourGuide::ToursController < ApplicationController
  def new
  	@tour = Tour.new
  	@genres = Genre.all
  end

  def create
  end

  def show
  end

  def index
  end

  def edit
  end
end
