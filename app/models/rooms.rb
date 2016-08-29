class Rooms
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  field :id, type: Integer

  index({ id: 1 }, { unique: true })
end
