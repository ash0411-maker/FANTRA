class Tourist::ChatNoticesController < ApplicationController

  def index
  	@chat_notices = current_tourist.tourist_passive_notices.page(params[:page]).per(20)
  end

end
