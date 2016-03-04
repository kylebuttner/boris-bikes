require 'van'
require 'dockingstation'
require 'garage'

shared_examples_for "BikeContainer" do
  let(:bikecontainer) { described_class.new }

  it 'should show stored bikes' do
    expect(bikecontainer.bikes).to eq([])
  end

  describe 'load' do

    it 'should take broken(or non broken) bikes when told' do
      good_bike = double(:good_bike, working: true)
      broken_bike = double(:broken_bike, working: false)
      station = double(:station, bikes: [good_bike, broken_bike])
      #allow(station).to receive(:remove_bikes).with(broken_bike).and_return(station.bikes.delete(broken_bike))
      #allow(station).to receive(:remove_bikes).with(good_bike).and_return(station.bikes.delete(good_bike))
      bikecontainer.load(station, true)
      expect(bikecontainer.bikes).to eq([broken_bike])
    end

  end

end

describe Van do
  it_behaves_like 'BikeContainer'
end

describe Garage do
  it_behaves_like 'BikeContainer'
end

describe DockingStation do
  it_behaves_like 'BikeContainer'
end
