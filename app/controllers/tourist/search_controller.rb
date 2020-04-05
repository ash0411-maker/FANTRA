class Tourist::SearchController < ApplicationController
  before_action :authenticate_tourist!

  def search
  	@content = params["search"]["content"]
    @city = City.match(@content)
    unless @city.nil?
    	@tours = @city.tours
    else
    	@tours = 0
    end
  end
end
