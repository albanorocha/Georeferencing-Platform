json.array!(@legal_profiles) do |legal_profile|
  json.extract! legal_profile, :id, :cnpj
  json.url legal_profile_url(legal_profile, format: :json)
end
