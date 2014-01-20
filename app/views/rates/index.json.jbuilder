json.array!(@rates) do |rate|
  json.extract! rate, :id, :value, :rateable_id, :rateable_type
  json.url rate_url(rate, format: :json)
end
