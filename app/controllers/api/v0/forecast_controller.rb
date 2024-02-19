class Api::V0::ForecastController < ApplicationController
  def index
    location = LocationFacade.new(params[:location]).location.lat_and_long
    
    # require 'pry'; binding.pry
  end
end