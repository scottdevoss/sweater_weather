class MunchieService
  def self.conn
    conn = Faraday.new(url: "http://api.weatherapi.com") do |faraday|
      faraday.headers["weather"] = Rails.application.credentials.weather[:key]
    end
    response = conn.get("/v1/forecast.json?key=#{Rails.application.credentials.weather[:key]}&q=pueblo,co&days=5")
    
    data = JSON.parse(response.body, symbolize_names: true)

  end
end 