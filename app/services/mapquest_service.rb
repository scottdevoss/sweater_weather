class MapquestService
  # def self.conn
  #   Faraday.new(url: "https://www.mapquestapi.com/geocoding/v1/address")
  # end

  def self.get_coordinates(location)

    conn = Faraday.new(url: "https://www.mapquestapi.com") do |faraday|
          faraday.headers["mapquest"] = Rails.application.credentials.mapquest[:key]
        end
        response = conn.get("/geocoding/v1/address?key=#{Rails.application.credentials.mapquest[:key]}&location=cincinatti,oh")
    
        data = JSON.parse(response.body, symbolize_names: true)
    
    # response = conn.get("/geocoding/v1/address?key=#{Rails.application.credentials.mapquest[:key]}&location=cincinatti,oh")

    # JSON.parse(response.body, symbolize_names: true)
  end

  def self.consumer_key
    Rails.application.credentials.mapquest[:key]
  end
end