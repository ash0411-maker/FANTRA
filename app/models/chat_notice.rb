class ChatNotice < ApplicationRecord

	default_scope -> { order(created_at: :desc) }
	belongs_to :message, optional: true
	belongs_to :room, optional: true
	belongs_to :guide_visitor, class_name: 'Guide', foreign_key: 'visitor_id', optional: true
	belongs_to :guide_visited, class_name: 'Guide', foreign_key: 'visited_id', optional: true
	belongs_to :tourist_visitor, class_name: 'Tourist', foreign_key: 'visitor_id', optional: true
	belongs_to :tourist_visited, class_name: 'Tourist', foreign_key: 'visited_id', optional: true

end