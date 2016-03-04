class Garage

  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def load(location, broken)
      location.bikes.each do |bike|
        if broken == true
          location.bikes.delete(bike) unless bike.working
          @bikes << bike unless bike.working
        elsif broken == false
          location.bikes.delete(bike) if bike.working
          @bikes << bike if bike.working
        end
      end
    end
    
end
