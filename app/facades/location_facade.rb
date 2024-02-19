class LocationFacade
  def initialize(location)
    @location = location
  end

  def location
    service = LocationService.new

    json = service.get_location(@location)
    @data = Location.new(json)
  end
end