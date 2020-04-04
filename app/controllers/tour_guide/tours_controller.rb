class TourGuide::ToursController < ApplicationController

  def new
  	@tour = Tour.new
  	# @tour.tour_photos.build
  	@genres = Genre.all
  	# 都市だけ undefined method `map' for nil:NilClass が発生
  	# @cities = City.all
  end

  def create
  	@tour = Tour.new(tour_params)
  	@tour.guide_id = current_guide.id
  	@tour.save
  	redirect_to tour_guide_home_top_path
  end

  def show
  	@tour = Tour.find(params[:id])
  end

  def index
  	@genres = Genre.all
  	if params[:genre_id]
  		@genre = Genre.find(params[:genre_id])
  		@tour_all = @genre.tours.order(created_at: :desc)
  	else
  		@tour_all = Tour.all
  	end
  end

  def edit
  	@tour = Tour.find(params[:id])
  end

  def update
  	@tour = Tour.find(params[:id])
  	@tour.update(tour_params)
  	redirect_to tour_guide_tour_path(@tour)
  end

  private
  def tour_params
    params.require(:tour).permit(:genre_id, :city_id, :title, :body, :capacity, :price, :contents_of_price, :time, :is_active,)
  end
end


# params.require(:tour).permit(:genre_id, :city_id, :title, :body, :capacity, :price, :contents_of_price, :is_active,
#     	tour_photo_images: []
#     	)