class Admin::CommentsController < ApplicationController

	def destroy
		@comment = Comment.find(params[:id])
		@tour = @comment.tour
		@comment.destroy
		redirect_to admin_tour_path(@tour)
	end
end
