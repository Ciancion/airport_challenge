require 'traffic_controller'
require 'plane'
require 'airport'

describe TrafficController do

  it "land plane to an airport" do
    traffic_controller = TrafficController.new
    plane = Plane.new
    airport = Airport.new
    weather = double(:sunny_weather, stormy?: false )

    allow(traffic_controller).to receive(:weather).and_return(weather)

    expect(traffic_controller.land_to(plane, airport)).to eq("Plane is landed"
)
  end

  it "prevent landing when weather is stormy" do
    traffic_controller = TrafficController.new
    plane = Plane.new
    airport = Airport.new
    weather = double(:stormy_weather, stormy?: true)

    allow(traffic_controller).to receive(:weather).and_return(weather)

    expect(traffic_controller.land_to(plane, airport)).to eq("It is too windy and stormy out there")
  end

  it "take off plane from an airport and confirm plane left airport" do
    traffic_controller = TrafficController.new
    plane = Plane.new
    airport = Airport.new
    weather = double(:sunny_weather, stormy?: false)

    allow(traffic_controller).to receive(:weather).and_return(weather)

    expect(traffic_controller.takeoff_from(plane, airport)).to eq(true)
    expect(plane.left_airport?).to eq(true)
  end

  it "prevent take off when weather stormy" do
    traffic_controller = TrafficController.new
    plane = Plane.new
    airport = Airport.new
    weather = double(:stormy_weather,  stormy?: true)

    allow(traffic_controller).to receive(:weather).and_return(weather)

    expect(traffic_controller.takeoff_from(plane, airport)).to eq(false)
  end

  it "prevent landing when airport is full" do
    traffic_controller = TrafficController.new
    plane = Plane.new
    airport = double(:full_airport, add_plane: 'Airport is full')
    weather = double(:sunny_weather,  stormy?: false)

    allow(traffic_controller).to receive(:full?).and_return(airport)
    allow(traffic_controller).to receive(:weather).and_return(weather)

    expect(traffic_controller.land_to(plane, airport)).to eq('Airport is full')
  end

end