class Api::V1::MunchiesController < ApplicationController
  def index
    conn = Faraday.new(url: "http://api.weatherapi.com") do |faraday|
      faraday.headers["weather"] = Rails.application.credentials.weather[:key]
    end
    response = conn.get("/v1/forecast.json?key=#{Rails.application.credentials.weather[:key]}&q=pueblo,co&days=5")
    
    data = JSON.parse(response.body, symbolize_names: true)
    require 'pry'; binding.pry
  end

  def reviews
    conn = Faraday.new(url: "https://api.yelp.com") do |faraday|
      require 'pry'; binding.pry
      faraday.headers["yelp"] = Rails.application.credentials.yelp[:key]
    end
    response = conn.get("/v3/businesses/north-india-restaurant-san-francisco/reviews")
    
    data = JSON.parse(response.body, symbolize_names: true)
    require 'pry'; binding.pry
  end
end