class Tourist::SearchController < ApplicationController

  before_action :authenticate_tourist!

  def search
  	if @content = params["search"]["content"]
	    @city = City.match(@content)
	    unless @city.nil?
	    	@tours = @city.tours
	    else
	    	@tours = 0
	    end
	else
		flash[:warning] = "都市名を入力してください"
		redirect_to tourist_tours_path
	end
  end
end
