json.array!(@prices) do |price|
  json.extract! price, :id, :value, :food_id
  json.url price_url(price, format: :json)
end
