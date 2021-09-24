class Airline < ApplicationRecord
  has_many :flights
  has_many :passengers, through: :flights

  def all_passengers
    passengers.distinct.where("age >= 18")
  end
end
