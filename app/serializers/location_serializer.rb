class LocationSerializer
  include JSONAPI::Serializer
  attributes :latitude, :longitude
end