json.array!(@properties) do |property|
  json.extract! property, :id, :title, :description, :features
  json.url property_url(property, format: :json)
end
