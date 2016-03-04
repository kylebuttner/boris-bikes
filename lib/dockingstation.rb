#require_relative 'bike.rb'
require_relative 'bike_container'

class DockingStation

	  include BikeContainer

	  DEFAULT_CAPACITY = 20

	  attr_reader :bikes, :capacity

	  def initialize(capacity=DEFAULT_CAPACITY)
	    set_up_container(capacity)
	  end

	def dock(bike)
		fail "Station is full" if full?
		if bike.working?
			bikes << bike
		else
			bikes.reverse!
			bikes << bike
			bikes.reverse!
		end
	end

	def release_bike
		fail "No bikes available" if empty?
		fail "Bike is broken" if !bikes.last.working?
		# bikes.sort{|x,y| x.working? <=> y.working?}
		bikes.pop
	end

	# private

		attr_reader :bikes

		def full?
		 bikes.length >= capacity
		end

		def empty?
		 bikes.length < 1
		end

end
