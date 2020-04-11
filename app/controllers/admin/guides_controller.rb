class Admin::GuidesController < ApplicationController

  before_action :authenticate_admin!


  def index
  	@guides = Guide.all.with_deleted
  end

  def show
  	@guide = Guide.with_deleted.find(params[:id])
  end

  def update
  	@guide = Guide.with_deleted.find(params[:id])
      if @guide.update(guide_params)
        if guide_params[:deleted_at].to_i == 0
           @guide.restore
           flash[:notice] = "情報を更新しました"
           redirect_to admin_guide_path(@guide)
        else
           @guide.destroy
           flash[:notice] = "情報を更新しました"
           redirect_to admin_guide_path(@guide)
        end
      else
         render 'edit'
         flash[:notice] = "情報の更新に失敗しました"
      end
  end


  private
  def guide_params
    params.require(:guide).permit(:deleted_at)
  end
end
