class Tourist::ChatNoticesController < ApplicationController

  before_action :authenticate_tourist!
  before_action :correct_tourist, only: [:index]

  def index
  	@chat_notices = current_tourist.tourist_passive_notices.joins(:message).where('messages.is_tourist = ?',0).page(params[:page]).per(20)
  end

  private
  def correct_tourist
      tourist = Tourist.find(params[:tourist_id])
      if current_tourist != tourist
        redirect_to tourist_tourist_path(current_tourist)
      end
  end

end

# @chat_notices = current_tourist.tourist_passive_notices.page(params[:page]).per(20)
# 上記を用いてview上で条件分岐で「if message.is_tourist == false」としていたが、
# これだとページングで問題が出るため修正した。
