class MunchieSerializer
  include JSONAPI::Serializer
  attributes :destination_city, :restaurant
end