class TourGuide::GuidesController < ApplicationController

    before_action :correct_guide_for_delete, only:[:delete]
    before_action :correct_guide, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_guide!, only: [:show, :edit, :update, :destroy]


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

  def destroy
    @guide = Guide.find(params[:id])
    @guide.destroy
    redirect_to tour_guide_guide_thanks_path
  end

  def delete
  end

  def thanks
  end


  private
  def guide_params
    params.require(:guide).permit(:family_name, :name, :address, :postal_code, :email, :phone_number, :identification_image, :selfy_image, :introduction_image, :introduction)
  end

  def correct_guide
    guide = Guide.find(params[:id])
    if guide_signed_in?
      if current_guide != guide
        redirect_to tour_guide_guide_path(current_guide)
      end
    else
      redirect_to new_guide_session_path
    end
  end

  def correct_guide_for_delete
    guide = Guide.find(params[:guide_id])
    if current_guide != guide
      redirect_to tour_guide_guide_path(current_guide)
    end
  end



end


