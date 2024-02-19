class Location
  attr_reader :lat_and_long
  def initialize(data)
    @lat_and_long = "#{data[:results][0][:locations][0][:latLng][:lat]}, #{data[:results][0][:locations][0][:latLng][:lng]}"
  end
end