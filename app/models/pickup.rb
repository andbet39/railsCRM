class Pickup
  include Mongoid::Document
  field :customer_name, type: String
  field :customer_surname, type: String
  field :customer_email, type: String
  field :customer_phone, type: String
  field :airport, type: String
  field :passengers, type: Integer
  field :terminal, type: String
  field :arrival_time, type: Time
  field :arrival_date, type: Date
  field :flight_number, type: String
  field :price, type: Float
  field :confirmed, type: Boolean
  field :res_code, type: String

  validates :passengers, numericality: { only_integer: true }
  validates :customer_name, :customer_surname, :customer_email,:passengers,:flight_number,:arrival_date, :arrival_time, :airport, presence: true

end
