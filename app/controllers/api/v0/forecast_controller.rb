class Api::V0::ForecastController < ApplicationController
  def index
    location = LocationFacade.new(params[:location]).location.lat_and_long
    weather = WeatherFacade.new.location_weather(location)

    # conn = Faraday.new(url: "http://api.weatherapi.com") do |faraday|
    #   faraday.params[:key] = Rails.application.credentials.weather[:key]
    # end

    # response = conn.get("/v1/forecast.json?q=#{location}&days=5")

    # data = JSON.parse(response.body, symbolize_names: true)
    # Weather.new(data)
    
    # require 'pry'; binding.pry
  end
end