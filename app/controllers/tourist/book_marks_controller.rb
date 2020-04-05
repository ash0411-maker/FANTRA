class Tourist::BookMarksController < ApplicationController

    def index
        @book_marks = current_tourist.book_marks
    end

	def create
        @tour = Tour.find(params[:tour_id])
        bookmark = current_tourist.book_marks.new(tour_id: @tour.id)
        bookmark.save
    end

    def destroy
        @tour = Tour.find(params[:tour_id])
        bookmark = current_tourist.book_marks.find_by(tour_id: @tour.id)
        bookmark.destroy
    end
end
