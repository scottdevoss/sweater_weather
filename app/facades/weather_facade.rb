class WeatherFacade

  def location_weather(lat_and_long)
    service = WeatherService.new

    json = service.weather_by_location(lat_and_long)
  
    Weather.new(json)
  end
end