class TourGuide::ToursController < ApplicationController
  before_action :authenticate_guide!

  def new
  	@tour = Tour.new
    @tour_photo = @tour.tour_photos.build
  end


  def create
  	@tour = Tour.new(tour_params)
  	@tour.guide_id = current_guide.id
  	if @tour.save
  	 redirect_to tour_guide_tour_path(@tour)
    else
      render 'new'
    end
  end


  def show
  	@tour = Tour.find(params[:id])
    @tour_photos = @tour.tour_photos
  end


  def index
  	@genres = Genre.all
  	if params[:genre_id]
  		@genre = Genre.find(params[:genre_id])
  		@tours = @genre.tours.order(created_at: :desc)
  	else
  		@tours = Tour.all
  	end
  end

  def edit
  	@tour = Tour.find(params[:id])
  end


  def update
  	@tour = Tour.find(params[:id])
  	@tour.update!(tour_params)
  	redirect_to tour_guide_tour_path(@tour)
  end


  def destroy
    @tour = Tour.find(params[:id])
    @tour.destroy
    redirect_to tour_guide_guide_path(current_guide)
  end



  private
  def tour_params
  params.require(:tour).permit(:genre_id, :city_id, :title, :body, :capacity, :time, :price,
    :contents_of_price, :meetingpoint_address, :meetingpoint_introduction, :is_active, tour_photos_attributes: [:id, :image, :tour_id, :_destroy])
  end

end


