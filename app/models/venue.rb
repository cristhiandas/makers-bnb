class Venue
  include DataMapper::Resource

  property :id, Serial
  property :title, Text, :unique => true
  property :address, Text
  property :price, Integer
  # property :user_id, Integer
  property :description, Text

  validates_presence_of :title, :address, :price

  has n, :pictures, through: Resource
  has n, :reservations, through: Resource
  has 1, :user, through: Resource
end
