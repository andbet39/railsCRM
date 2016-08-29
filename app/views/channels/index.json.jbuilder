json.array!(@channels) do |channel|
  json.extract! channel, :id, :name, :id, :color
  json.url channel_url(channel, format: :json)
end
