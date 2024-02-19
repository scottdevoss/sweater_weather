class WeatherService
  def weather_by_location(lat_and_long)
    get_url("/v1/forecast.json?q=#{lat_and_long}&days=5")
  end

  def get_url(url)
    response = conn.get(url)

    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "http://api.weatherapi.com") do |faraday|
      faraday.params[:key] = Rails.application.credentials.weather[:key]
    end
  end
end