class FlightPassengersController < ApplicationController
  def create
    @flight_passengers = FlightPassenger.create!(flight_passengers_params)
  end

  def destroy
    FlightPassenger.find(params[:id]).destroy
    redirect_to flights_path
  end

  private
  def flight_passengers_params
    params.permit(:flight_id, :passenger_id)
  end
end
