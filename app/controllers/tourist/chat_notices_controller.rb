class Tourist::ChatNoticesController < ApplicationController

  def index
  	@chat_notices = current_tourist.tourist_passive_notices.joins(:message).where('messages.is_tourist = ?',0).page(params[:page]).per(20)
  end

end

# @chat_notices = current_tourist.tourist_passive_notices.page(params[:page]).per(20)
# 上記を用いてview上で条件分岐で「if message.is_tourist == false」としていたが、
# これだとページングで問題が出るため修正した。
