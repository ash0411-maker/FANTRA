class Tourist::CommentsController < ApplicationController

	before_action :authenticate_tourist!
	before_action :correct_tourist, only: [:create]

	def create
		@tour = Tour.find(params[:tour_id])
		comment = current_tourist.comments.new(comment_params)
		comment.tour_id = @tour.id
		if comment.save
			order = Order.find(params[:order_id])
			order.update(status: "レビュー済み")
			@tour.create_notification_comment!(current_tourist, comment.id)
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

  	def correct_tourist
  		tourist = Tourist.find(params[:tourist_id])
  		if current_tourist != tourist
  		  redirect_to tourist_tourist_path(current_tourist)
  		end
  	end


end
