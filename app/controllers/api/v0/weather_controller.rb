class Api::V0::WeatherController < ApplicationController

  def forecast
    test = render json: ForecastSerializer.new(params[:id])
    
    mapquest_data = mapquest_api_call
    weather_data = weather_api_call

    combined_data = { mapquest: mapquest_data, weather: weather_data }

    render json: combined_data
  end

  private

  def mapquest_api_call
    conn = Faraday.new(url: "https://www.mapquestapi.com") do |faraday|
      faraday.headers["mapquest"] = Rails.application.credentials.mapquest[:key]
    end
    response = conn.get("/geocoding/v1/address?key=#{Rails.application.credentials.mapquest[:key]}&location=cincinatti,oh")

    data = JSON.parse(response.body, symbolize_names: true)
    # result = render json:(data)
  end
  
  def weather_api_call
    conn = Faraday.new(url: "http://api.weatherapi.com") do |faraday|
      faraday.headers["weather"] = Rails.application.credentials.weather[:key]
    end
    response = conn.get("/v1/forecast.json?key=#{Rails.application.credentials.weather[:key]}&q=39.10713,-84.50413&days=5")
    
    data = JSON.parse(response.body, symbolize_names: true)
    
    # result = render json:(data)
  end
end