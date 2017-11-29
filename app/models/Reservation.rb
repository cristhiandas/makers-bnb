class Reservation
  include DataMapper::Resource

  property :id, Serial
  # property :venue_id, Integer
  property :start_date, Date
  property :end_date, Date

  has 1, :user, through: Resource
  has 1, :venue, through: Resource
end
