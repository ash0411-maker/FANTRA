class Tourist::TouristsController < ApplicationController
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

  private
  def tourist_params
    params.require(:tourist).permit(:family_name, :name, :nationnality, :birth_year, :address, :postal_code, :email, :phone_number, :sex)
  end

end
