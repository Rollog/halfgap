json.array!(@locations) do |location|
  json.extract! location, :id, :lat, :lon, :name
  json.url location_url(location, format: :json)
end
