Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :airlines, only: :show
resources :flights
resources :flight_passengers, only: :destroy
end
