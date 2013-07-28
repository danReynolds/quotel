json.array!(@quotes) do |quote|
  json.extract! quote, :description
  json.url quote_url(quote, format: :json)
end
