class Tourist::CommentsController < ApplicationController

	def create
		@tour = Tour.find(params[:tour_id])
		comment = current_tourist.comments.new(comment_params)
		comment.tour_id = @tour.id
		if comment.save
			redirect_to tourist_tourist_tour_path(current_tourist, @tour)
		else
			flash[:notice] = "レビューコメントを入力してください"
			redirect_to tourist_tourist_path(current_tourist)
		end
	end

	private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
