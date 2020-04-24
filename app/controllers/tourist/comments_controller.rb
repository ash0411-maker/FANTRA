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
		# -------- 通知機能（レビューコメント）--------
			save_notification_comment(comment.id, @tour.guide.id, @tour.id)
		# -------- 通知機能（レビューコメント）--------
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


  # -------- 通知機能（レビューコメント）--------
	def save_notification_comment(comment_id, guide_id, tour_id)
	    notification = current_tourist.notifications.new(
	    	tour_id: tour_id,
	    	guide_id: guide_id,
	    	comment_id: comment_id,
	    	tourist_id: current_tourist,
	     	action: 'comment'
	    )
	    notification.save if notification.valid?
	end
# -------- 通知機能（レビューコメント）--------

end



