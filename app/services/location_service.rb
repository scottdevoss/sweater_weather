class LocationService
  def get_location(location)
    get_url("/geocoding/v1/address?&location=#{location}")
  end

  def get_url(url)
    response = conn.get(url)

    json = JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://www.mapquestapi.com") do |faraday|
      faraday.params[:key] = Rails.application.credentials.mapquest[:key]
    end
  end
end