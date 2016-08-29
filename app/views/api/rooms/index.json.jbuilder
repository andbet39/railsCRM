json.array!(@api_rooms) do |api_room|
  json.extract! api_room, :id, :name ,:occupancy , :availability
  json.url api_room_url(api_room, format: :json)
end
