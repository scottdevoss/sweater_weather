class WeatherService
  def self.conn
    Faraday.new(url: "http//api.weatherapi.com/v1")
  end

  def self.get_forecast(coordinates)
    coordinates = "39.10713,-84.50413"
    response = conn.get("/forecast.json?key=#{api_key}&q=#{coordinates}&days=5")
   
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.api_key
    Rails.application.credentials.weather[:key]
  end
end