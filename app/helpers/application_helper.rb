module ApplicationHelper

	def unchecked_notifications
		@notifications = current_guide.notifications.where(checked: false)
	end



	def unchecked_tourist_chat_notices
		rooms = current_tourist.rooms
		notifications = []
		rooms.each do |room|
			room.messages.each do |message|
				if message.is_tourist == false
					unless message.chat_notices.where(checked: false, visited_id: current_tourist.id).empty?
						notifications << message.chat_notices.where(checked: false, visited_id: current_tourist.id)
					end
				end
			end
		end

		return notifications
	end




	def unchecked_guide_chat_notices
		rooms = current_guide.rooms
		notifications = []
		rooms.each do |room|
			room.messages.each do |message|
				if message.is_tourist == true
					unless message.chat_notices.where(checked: false, visited_id: current_guide.id).empty?
						notifications << message.chat_notices.where(checked: false, visited_id: current_guide.id)
					end
				end
			end
		end

		return notifications
	end

end
