class Admin::SearchController < ApplicationController
  before_action :authenticate_admin!

  def search
  	if @content = params["search"]["content"]
	    @city = City.match(@content)
	    results = Geocoder.search(@content)
		@cordinates = results.first.coordinates
	    unless @city.nil?
	    	@tours = @city.tours
	    else
	    	@tours = 0
	    end
	else
		flash[:warning] = "都市名を入力してください"
		redirect_to admin_tours_path
	end
  end
end
