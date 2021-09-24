require 'rails_helper'
# rspec spec/models/passenger_spec.rb
RSpec.describe Passenger, type: :model do
  describe 'relationships' do
    it { should have_many(:flight_passengers) }
    it { should have_many(:flights).through(:flight_passengers) }
  end

  describe 'class methods' do
    before :each do
      @airline1 = Airline.create!(name: "Best Airline")
      @flight1 = @airline1.flights.create!(number: 1, date: "08/03/20", departure_city: "Denver", arrival_city: "Reno")
      @flight2 = @airline1.flights.create!(number: 2, date: "09/03/20", departure_city: "Atlanta", arrival_city: "Phoenix")
      @passenger1 = Passenger.create!(name: "Best Passenger", age: 25)
      @passenger2 = Passenger.create!(name: "Annoying Passenger", age: 10)
      @passenger3 = Passenger.create!(name: "Rude Passenger", age: 30)
      @passenger4 = Passenger.create!(name: "Tiny Passenger", age: 5)
      FlightPassenger.create!(flight_id: @flight1.id, passenger_id: @passenger1.id)
      FlightPassenger.create!(flight_id: @flight2.id, passenger_id: @passenger1.id)
      FlightPassenger.create!(flight_id: @flight1.id, passenger_id: @passenger2.id)
      FlightPassenger.create!(flight_id: @flight2.id, passenger_id: @passenger3.id)
    end

    it 'counts flights taken by passenger' do
      expect(@passenger1.flight_count).to eq(2)
    end
  end
end
