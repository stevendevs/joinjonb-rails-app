

class ExploreController < ApplicationController
  def show
    if params[:location].present?
      results = Geocoder.search(params[:location])
      @map_x = results.first.coordinates[0]
      @map_y = results.first.coordinates[1]
      @courses = Course.near([@map_x, @map_y], 50)
      # initial setup
   
      
    end
  end
end





