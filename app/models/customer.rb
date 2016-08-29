class Customer
  include Mongoid::Document
  field :mail, type: String
  field :city, type: String
  field :country, type: String
  field :name, type: String
  field :surname, type: String
  field :notes, type: String
  field :phone, type: String
  field :address, type: String
  field :language, type: String
  field :zip, type: String

  index({ mail: 1 }, { unique: true })

end
