json.array!(@physical_profiles) do |physical_profile|
  json.extract! physical_profile, :id, :cpf
  json.url physical_profile_url(physical_profile, format: :json)
end
