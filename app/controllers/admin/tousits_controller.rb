class Admin::TousitsController < ApplicationController

  def index
  	@tousits = Tourist.all
  end

  def show
  	@tourist = Tourist.find(params[:id])
  end

  def edit
  	@tourist = Tourist.find(params[:id])
  end
end
