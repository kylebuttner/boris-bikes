require 'dockingstation'

describe DockingStation do
	it {expect(subject).to respond_to :release_bike }

	it 'should raise an error when no bikes available' do
		station = DockingStation.new
		bike = Bike.new
		expect {station.release_bike}.to raise_error("No bikes available")
	end

	it 'should raise an error when station is full' do
		station = DockingStation.new
		bike = Bike.new
		DockingStation::DEFAULT_CAPACITY.times{station.dock(bike)}
		expect {station.dock(bike)}.to raise_error("Station is full")
	end

	it "checks whether release_bike gets a bike" do
		station = DockingStation.new
		bike = Bike.new
		station.dock(bike)
	  expect(station.release_bike).to eq (bike)
	end

	it 'expects bikes to be working' do
		station = DockingStation.new
		bike = Bike.new
		expect(Bike.new.working?).to eq (false or true)
	end

	it 'should dock a bike' do
		station = DockingStation.new
		bike = Bike.new
		expect(subject).to respond_to(:dock).with(1).argument
	end


	it 'should return docked bike' do
		station = DockingStation.new
		bike = Bike.new
		expect(station.dock(bike)).to eq([bike])
	end

	it 'should return docked bike' do
		station = DockingStation.new
		bike = Bike.new
		station.dock(bike)
		expect(station.bikes).to eq([bike])
	end

	describe "#dock" do
		it 'should raise an error when full' do
			station = DockingStation.new
			DockingStation::DEFAULT_CAPACITY.times{station.dock(Bike.new)}
			expect{station.dock(Bike.new)}.to raise_error "Station is full"
		end
	end

  it 'should accept capacity parameter' do
  	expect(DockingStation).to respond_to(:new).with(1).argument
  end


end
