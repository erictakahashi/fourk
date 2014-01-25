json.array!(@establishments) do |establishment|
  json.extract! establishment, :id, :name, :description, :address, :zipcode, :city
  json.url establishment_url(establishment, format: :json)
end