require 'rails_helper'
# rspec spec/features/flights/index_spec.rb
RSpec.describe 'Flight Index Page' do
  before :each do
    @airline1 = Airline.create!(name: "Best Airline")
    @flight1 = @airline1.flights.create!(number: 1, date: "08/03/20", departure_city: "Denver", arrival_city: "Reno")
    @flight2 = @airline1.flights.create!(number: 2, date: "09/03/20", departure_city: "Atlanta", arrival_city: "Phoenix")
    @passenger1 = Passenger.create!(name: "Best Passenger", age: 25)
    @passenger2 = Passenger.create!(name: "Annoying Passenger", age: 10)
    @passenger3 = Passenger.create!(name: "Rude Passenger", age: 30)
    FlightPassenger.create!(flight_id: @flight1.id, passenger_id: @passenger1.id)
    FlightPassenger.create!(flight_id: @flight1.id, passenger_id: @passenger2.id)
    FlightPassenger.create!(flight_id: @flight2.id, passenger_id: @passenger3.id)

    visit flights_path
  end

  describe 'display flights and their attributes' do
    it 'lists flight numbers, airlines and passengers' do
      expect(page).to have_content("All Flights")
      expect(page).to have_content("Flight Number:")
      expect(page).to have_content("Airline:")
      expect(page).to have_content("Best Passenger")
      expect(page).to have_content(@flight1.number)
      expect(page).to have_content(@flight2.number)
      expect(@flight1.passengers).to eq([@passenger1, @passenger2])
      expect(@flight2.passengers).to eq([@passenger3])
      expect(page).to have_content(@flight2.airline.name)
    end
  end
  describe 'remove passengers' do
    it 'can remove a passenger from a flight' do
      expect(page).to have_link('Remove')

      click_on "Remove Best Passenger"

      expect(page).to have_no_content(@passenger1.name)
      expect(current_path).to eq(flights_path)
    end
  end
end
