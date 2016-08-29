class Wubookreservation
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  belongs_to :channel, :foreign_key => 'id_channel'

  field :reservation_code, type: Integer
  field :date_received, type:Date
  field :date_departure, type:Date
  field :date_arrival, type:Date



  field :customer_extracted, type:Boolean
  field :checkin_mail_sent , type:Boolean

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

  def channel_id
    self.id_channel
  end

end
