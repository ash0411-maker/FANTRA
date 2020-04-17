module ApplicationHelper
	def unchecked_notifications
		@notifications = current_guide.notifications.where(checked: false)
	end
end
