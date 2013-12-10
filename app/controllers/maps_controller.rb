class MapsController < ApplicationController

	def geocode
		position = Geocoder.coordinates(params[:query])
		respond_to do |format|
			format.json { render json: position}
		end
	end

end