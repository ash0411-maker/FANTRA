class Tourist::ToursController < ApplicationController

  def index
  	@genres = Genre.all
  	if params[:genre_id]
  		@genre = Genre.find(params[:genre_id])
  		@tours = @genre.tours.order(created_at: :desc)
  	else
  		@tours = Tour.all
  	end
  end

  def show
  	@tour = Tour.find(params[:id])
    @tour_photos = @tour.tour_photos


    rooms = current_tourist.rooms
    #自分が入ってるroomの相手のidを格納する
    @guide_ids = []
    rooms.each do |room|
      @guide_ids << room.guide_id
    end
  end

end
