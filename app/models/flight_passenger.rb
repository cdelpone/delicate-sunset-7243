class FlightPassenger < ApplicationRecord
  belongs_to :flight
  belongs_to :passenger

  def self.related(flight)
    find_by(flight_id: flight.id)
  end
end
