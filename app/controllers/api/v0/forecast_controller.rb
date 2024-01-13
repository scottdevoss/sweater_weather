class Api::V0::ForecastController < ApplicationController
  def show
    location = params[:location]
    conn = Faraday.new(url: "https://www.mapquestapi.com") do |faraday|
      faraday.headers["API_KEY"] = Rails.application.credentials.mapquest[:key]
    end
    response = conn.get("/geocoding/v1/address?key=cjGGjAF7SDrvSnRdGQ0KpNik0U0n8l7X&location=Washington,DC")

    data = JSON.parse(response.body, symbolize_names: true)

    latitude = 0
    longitude = 0
    data[:results].each do |result|
      result[:locations].each do |location|
        latitude += location[:latLng][:lat]
        longitude += location[:latLng][:lng]
      end
      latitude
      longitude
    end
  end
end