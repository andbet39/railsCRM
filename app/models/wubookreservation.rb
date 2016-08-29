class Wubookreservation
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  field :reservation_code, type: Integer
  field :date_received, type:Date
  field :date_departure, type:Date
  field :date_arrival, type:Date



  field :customer_extracted, type:Boolean

  index({ reservation_code: 1 }, { unique: true })

  def roomnames
    rooms = self.rooms.split(",")
    name=""
    rooms.each() do |r|
      room = Rooms.find(r.to_i)
      name << room.name << " "
    end
    name
  end

  def daybefore
    days  = self.date_arrival - self.date_received
    days.to_i
  end

end
