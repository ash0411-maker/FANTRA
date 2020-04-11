class Tourist::TouristsController < ApplicationController
  before_action :authenticate_tourist!, only: [:show, :edit, :update, :destroy]
  before_action :correct_tourist, only: [:show, :edit, :update, :destroy]


  def show
  	@orders = current_tourist.orders
  end

  def edit
  	@tourist = Tourist.find(params[:id])
  end

  def update
  	@tourist = Tourist.find(params[:id])
  	if @tourist.update(tourist_params)
  		redirect_to tourist_tourist_path(@tourist)
  	else
  		render 'edit'
  	end
  end

  def destroy
    @tourist = Tourist.find(params[:id])
    @tourist.destroy
    redirect_to tourist_tourist_thanks_path
  end

  def delete
  end

  def thanks
  end


  private
  def tourist_params
    params.require(:tourist).permit(:family_name, :name, :nationnality, :birth_year, :address, :postal_code, :email, :phone_number, :sex)
  end

  def correct_tourist
    tourist = Tourist.find(params[:id])
    if current_tourist != tourist
      redirect_to tourist_tourist_path(current_tourist)
    end
  end

end
