class TourGuide::NotificationsController < ApplicationController

  # 未確認の通知レコードだけ取り出したあと、「未確認→確認済」
  def index
  	@notifications = current_guide.notifications.page(params[:page]).per(20)
    @notifications.where(checked: false).each do |notification|
      notification.update_attributes(checked: true)
    end
  end


end
