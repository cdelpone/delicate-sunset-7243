require 'rails_helper'
# rspec spec/models/flight_passenger_spec.rb
RSpec.describe FlightPassenger, type: :model do
  before :each do
    @airline1 = Airline.create!(name: "Best Airline")
    @flight1 = @airline1.flights.create!(number: 1, date: "08/03/20", departure_city: "Denver", arrival_city: "Reno")
    @flight2 = @airline1.flights.create!(number: 2, date: "09/03/20", departure_city: "Atlanta", arrival_city: "Phoenix")
    @passenger1 = Passenger.create!(name: "Best Passenger", age: 25)
    @passenger2 = Passenger.create!(name: "Annoying Passenger", age: 10)
    @passenger3 = Passenger.create!(name: "Rude Passenger", age: 30)
    @fl1 = FlightPassenger.create!(flight_id: @flight1.id, passenger_id: @passenger1.id)
    @fl2 = FlightPassenger.create!(flight_id: @flight1.id, passenger_id: @passenger2.id)
    @fl3 = FlightPassenger.create!(flight_id: @flight2.id, passenger_id: @passenger3.id)
  end
  describe 'relationships' do
    it { should belong_to(:flight) }
    it { should belong_to(:passenger) }
  end

  describe 'class methods' do
    it 'relates to a flight' do
      expect(FlightPassenger.related(@flight1)).to eq(@fl1)
    end
  end
end
