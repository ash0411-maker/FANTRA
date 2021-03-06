class TourGuide::NotificationsController < ApplicationController

  before_action :authenticate_guide!
  before_action :correct_guide

  # 未確認の通知レコードだけ取り出したあと、「未確認→確認済」
  def index
  	@notifications = current_guide.notifications.page(params[:page]).per(20)
    @notifications.where(checked: false).each do |notification|
      notification.update_attributes(checked: true)
    end
  end



  private
  def correct_guide
    guide = Guide.find(params[:guide_id])
    if current_guide != guide
      redirect_to tour_guide_guide_path(current_guide)
    end
  end


end
