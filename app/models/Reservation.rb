require 'date'

class Reservation
  include DataMapper::Resource

  property :id, Serial
  # property :venue_id, Integer
  property :start_date, Date
  property :end_date, Date

  def self.check(venue_reservations, start_date, end_date)
    venue_reservations.each do |past_reservations|
        if date(Date.parse(past_reservations.end_date.to_s),
          Date.parse(past_reservations.start_date.to_s),
          Date.parse(start_date.to_s), Date.parse(end_date.to_s)) == true
          @reservation = true
        end
    end
    if @reservation == true
      return true
    else
      return false
    end
  end

  def self.date(end_date, start_date, new_start, new_end)
      (end_date > new_start && new_start >= start_date) ||
      (end_date >= new_end && new_end > start_date) ||
      (new_start <= start_date && new_end >= end_date)
  end

  has 1, :user, through: Resource
  has 1, :venue, through: Resource

end
