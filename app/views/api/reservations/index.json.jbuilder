json.array!(@api_reservations) do |r|
  json.id r.reservation_code
  json.text r.customer_name
  json.start r.date_arrival.strftime("%Y-%m-%d")
  json.end r.date_departure.strftime("%Y-%m-%d")
  json.resource r.rooms.to_i
  json.bubbleHtml r.customer_mail
  json.id_channel r.id_channel
  json.customer_name r.customer_name
  json.customer_surname r.customer_surname
end
