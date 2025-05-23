class ExploreController < ApplicationController
  def show

if params[:location].present?

  results = Geocoder.search(params[:location])
   @map_coordenates = results.first.coordinates
  # => [48.856614, 2.3522219]  # latitude and longitude

end

  end
end
