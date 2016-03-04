require './lib/dockingstation.rb'
require './lib/van.rb'
require './lib/garage.rb'
require './lib/bike.rb'

# # setup
van = Van.new
garage = Garage.new
station = DockingStation.new
bikes = []

# create some working bikes
10.times { bikes << Bike.new }

bikes[1].working = false

bikes.each do |bike|
  station.dock(bike)
end

p station.bikes

van.load(station, true)

p van
#
# p van
# # garage accepts bikes
# bikes.each {|bike| garage.accept(bike)}
#
# #garage fixes bikes
# garage.fix!
#
# # load all the bikes in the garage into a van
# while !bike.nil?
#
#   bike = garage.release
#   van.load(bike)
#
# end
#
# # unload the van into a docking station
#
# while !bike.nil?
#   bike = van.unload
#   station.dock(bike)
# end
#
# # person uses bike
# bike = station.release_bike
#
# #person breaks bike
# bike.working = false
#
# #person docks bike
# station.dock(bike)
#
# #van loads broken bikes
#
# while !bike.nil?
#   bike = station.release_bike(BROKEN)
#   van.load(bike)
# end
#
# # van unloads broken bikes to garage
#
# while !bike.nil?
#   bike = van.unload
#   garage.accept(bike)
#
# end
