require 'rails_helper'
# rspec spec/models/flight_passenger_spec.rb
RSpec.describe FlightPassenger, type: :model do
  describe 'relationships' do
    it { should belong_to(:flight) }
    it { should belong_to(:passenger) }
  end
end
