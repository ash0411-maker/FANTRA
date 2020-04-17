class Comment < ApplicationRecord

  belongs_to :tourist
  belongs_to :tour
  has_many :notifications, dependent: :destroy

  validates :content, presence: true






 #  # 通知機能
 #  	def create_notification_comment!(current_user, comment_id)
	#   # 自分以外にコメントしている人をすべて取得し、全員に通知を送る
	#     temp_ids = Comment.select(:tourist_id).where(post_id: id).distinct
	#     temp_ids.each do |temp_id|
	#       save_notification_comment!(current_tourist, comment_id, temp_id['user_id'])
	#     end
	#     # まだ誰もコメントしていない場合は、投稿者に通知を送る
	#     save_notification_comment!(current_tourist, comment_id, user_id) if temp_ids.blank?
	# end


	# def save_notification_comment!(current_user, comment_id, visited_id)
	#     # コメントは複数回することが考えられるため、１つの投稿に複数回通知する
	#     notification = current_tourist.active_notifications.new(
	#       tour_id: id,
	#       comment_id: comment_id,
	#       visited_id: visited_id,
	#       action: 'comment'
	#     )
	#     # 自分の投稿に対するコメントの場合は、通知済みとする
	#     if notification.visitor_id == notification.visited_id
	#       notification.checked = true
	#     end
	#     notification.save if notification.valid?
	# end

end
