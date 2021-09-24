require 'rails_helper'
# rspec spec/features/airlines/show_spec.rb
RSpec.describe 'Airline Show Page' do
  before :each do
    @airline1 = Airline.create!(name: "Best Airline")
    @airline2 = Airline.create!(name: "Worst Airline")

    @flight1 = @airline1.flights.create!(number: 1, date: "08/03/20", departure_city: "Denver", arrival_city: "Reno")
    @flight2 = @airline1.flights.create!(number: 2, date: "09/03/20", departure_city: "Atlanta", arrival_city: "Phoenix")
    @flight3 = @airline2.flights.create!(number: 3, date: "10/03/20", departure_city: "Asheville", arrival_city: "Miami")

    @passenger1 = Passenger.create!(name: "Best Passenger", age: 25)
    @passenger2 = Passenger.create!(name: "Annoying Passenger", age: 10)
    @passenger3 = Passenger.create!(name: "Rude Passenger", age: 30)
    @passenger4 = Passenger.create!(name: "Tiny Passenger", age: 5)

    FlightPassenger.create!(flight_id: @flight1.id, passenger_id: @passenger1.id)
    FlightPassenger.create!(flight_id: @flight1.id, passenger_id: @passenger2.id)
    FlightPassenger.create!(flight_id: @flight2.id, passenger_id: @passenger1.id)
    FlightPassenger.create!(flight_id: @flight2.id, passenger_id: @passenger3.id)
    FlightPassenger.create!(flight_id: @flight2.id, passenger_id: @passenger4.id)
    FlightPassenger.create!(flight_id: @flight3.id, passenger_id: @passenger3.id)

    visit airline_path(@airline1)
  end

  describe 'Airline show page passengers' do
    it 'lists all passengers on that airline that are adults' do
      expect(page).to have_content("Passengers at Best Airline")
      expect(page).to have_content(@passenger1.name)
      expect(page).to have_content(@passenger3.name)
      expect(page).to have_content("Best Passenger")
      expect(page).to have_content("Rude Passenger")
    end

    it 'only shows adult passengers' do
      expect(page).to have_no_content("Annoying Passenger")
      expect(page).to have_no_content("Tiny Passenger")
      expect(page).to have_no_content(@passenger2.name)
      expect(page).to have_no_content(@passenger4.name)
    end
  end
end
