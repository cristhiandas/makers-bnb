class Venue
  include DataMapper::Resource

  property :id, Serial
  property :title, Text
  property :address, Text
  property :price, Integer
  property :start_date, Date
  property :end_date, Date

  # has n, :pictures
end
