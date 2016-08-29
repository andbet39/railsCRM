json.array!(@pickups) do |pickup|
  json.extract! pickup, :id, :customer_name, :customer_surname, :airport, :terminal, :arrival_time, :arrival_date, :flight_number
  json.url pickup_url(pickup, format: :json)
end
