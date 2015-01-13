json.array!(@outdoors) do |outdoor|
  json.extract! outdoor, :id, :name, :code, :description, :location
  json.url outdoor_url(outdoor, format: :json)
end
