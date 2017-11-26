require 'plane'

describe Plane do
  let(:plane) { Plane.new }

  it "report left airport" do
    expect(plane.fly).to eq("flying")
  end

  it "report landed to airport" do
    expect(plane.land).to eq("landed")
  end

  it "default state of a plane" do
    expect(plane.status).to eq("landed")
  end

  it "is flying" do
    plane.fly

    expect(plane.flying?).to eq(true)
  end

  it "is landed" do
    plane.land

    expect(plane.landed?).to eq(true)
  end

end
