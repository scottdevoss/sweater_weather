class Api::V0::ForecastController < ApplicationController
  def index
    location = LocationFacade.new(params[:location]).location.lat_and_long
    weather = WeatherSerializer.new(WeatherFacade.new.location_weather(location))
    render json: weather
  end
end