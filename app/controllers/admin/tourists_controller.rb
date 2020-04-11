class Admin::TouristsController < ApplicationController
	before_action :authenticate_admin!

  def index
  	@tourists = Tourist.all.with_deleted
  end

  def show
  	@tourist = Tourist.with_deleted.find(params[:id])
  end

  def update
    @tourist = Tourist.with_deleted.find(params[:id])
      if @tourist.update(tourist_params)
        if tourist_params[:deleted_at].to_i == 0
          flash[:notice] = "情報を更新しました"
           @tourist.restore
           redirect_to admin_tourist_path(@tourist)
        else
          flash[:notice] = "情報を更新しました"
           @tourist.destroy
           redirect_to admin_tourist_path(@tourist)
        end
      else
        flash[:notice] = "情報の更新に失敗しました"
         render 'edit'
      end
  end

  private
  def tourist_params
    params.require(:tourist).permit(:deleted_at)
  end

end
