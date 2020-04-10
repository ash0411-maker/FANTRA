class Admin::TouristsController < ApplicationController
	before_action :authenticate_admin!

  def index
  	@tourists = Tourist.all
  end

  def show
  	@tourist = Tourist.find(params[:id])
  end

  def edit
  	@tourist = Tourist.find(params[:id])
  end

end
