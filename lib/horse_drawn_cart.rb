class HorseDrawnCart
  attr_accessor :fuel_consumption, :capacity, :nuts_in_cart, :pile_of_nuts, :town

  def initialize(distance_from_town, nuts, fuel_consumption, capacity)
    self.fuel_consumption = fuel_consumption
    self.capacity = capacity
    self.nuts_in_cart = 0
  
    self.pile_of_nuts = PileOfNuts.new(distance_from_town, nuts)
    self.town = Town.new
  end
end