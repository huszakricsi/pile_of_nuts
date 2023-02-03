class PileOfNuts
  attr_accessor :distance_from_town, :nuts

  def initialize(distance_from_town, nuts)
    self.distance_from_town = distance_from_town
    self.nuts = nuts
  end
  
  def take_possible_nuts(amount)
    taken_nuts = 0

    if self.nuts > amount
      self.nuts -= amount
      taken_nuts = amount
    else
      taken_nuts = self.nuts
      self.nuts = 0
    end

    taken_nuts
  end
end
