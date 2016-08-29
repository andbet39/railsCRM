class Channel
  include Mongoid::Document
  field :name, type: String
  field :_id, type: Integer
  field :color, type: String

end
