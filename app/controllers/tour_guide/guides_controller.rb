class TourGuide::GuidesController < ApplicationController
  def show
  	@guide = Guide.find(params[:id])
  	@tours = @guide.tours
  end

  def edit
  	@guide = Guide.find(params[:id])
  end

  def update
  	@guide = Guide.find(params[:id])
  	if @guide.update(guide_params)
  		redirect_to tour_guide_guide_path(@guide)
  	else
  		render 'edit'
  	end
  end

  private
  def guide_params
    params.require(:guide).permit(:family_name, :name, :address, :postal_code, :email, :phone_number, :identification_image, :selfy_image, :introduction_image, :introduction)
  end
end
