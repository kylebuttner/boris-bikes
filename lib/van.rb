require_relative 'bike_container'

class Van

  include BikeContainer

  DEFAULT_CAPACITY = 20

  attr_reader :bikes, :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    set_up_container(capacity)
  end

end
