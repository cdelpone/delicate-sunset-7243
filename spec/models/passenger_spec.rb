require 'rails_helper'
# rspec spec/models/passenger_spec.rb
RSpec.describe Passenger, type: :model do
  describe 'relationships' do
    it { should have_many(:flight_passengers) }
    it { should have_many(:flights).through(:flight_passengers) }
  end
end
