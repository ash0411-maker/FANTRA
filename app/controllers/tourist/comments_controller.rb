class Tourist::CommentsController < ApplicationController

	def create
		@tour = Tour.find(params[:tour_id])
		comment = current_tourist.comments.new(comment_params)
		comment.tour_id = @tour.id
		comment.save
		redirect_to tourist_tourist_tour_path(current_tourist, @tour)
	end

	private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
