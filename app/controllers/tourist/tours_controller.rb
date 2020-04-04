class Tourist::ToursController < ApplicationController
  def index
  	@genres = Genre.all
  	if params[:genre_id]
  		@genre = Genre.find(params[:genre_id])
  		@tour_all = @genre.tours.order(created_at: :desc)
  	else
  		@tour_all = Tour.all
  	end
  end

  def show
  	@tour = Tour.find(params[:id])
  end
end
