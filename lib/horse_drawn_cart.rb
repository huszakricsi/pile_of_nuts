class HorseDrawnCart
  attr_accessor :fuel_consumption, :capacity, :nuts_in_cart, :pile_of_nuts, :town, :nuts_used_per_transport

  def initialize(distance_from_town, nuts, fuel_consumption, capacity)
    self.fuel_consumption = fuel_consumption
    self.capacity = capacity
    self.nuts_in_cart = 0
  
    self.pile_of_nuts = PileOfNuts.new(distance_from_town, nuts)
    self.town = Town.new
  end

  def nuts_in_town
    town.nuts
  end

  def take_possible_nuts!
    if nuts_used_per_transport > capacity
      raise 'No nuts can be taken to town: consumption is bigger than cart capacity'
    end
    if nuts_used_per_transport > pile_of_nuts.nuts
      raise 'No nuts can be taken to town: consumption is bigger than takeable nuts'
    end

    take_nuts_from_pile(capacity)
    transport
    put_down_nuts_at_town
    while can_take_more?
      take_nuts_from_town(nuts_used_per_transport)
      transport
      take_nuts_from_pile(capacity)
      transport
      put_down_nuts_at_town
    end
  end

  private

  def transport
    self.nuts_in_cart -= nuts_used_per_transport
  end

  def take_nuts_from_pile(amount)
    self.nuts_in_cart = pile_of_nuts.take_possible_nuts(amount)
  end

  def take_nuts_from_town(amount)
    self.nuts_in_cart = town.take_nuts(amount)
  end

  def put_down_nuts_at_town
    town.add_nuts(nuts_in_cart)
    self.nuts_in_cart = 0
  end

  def can_take_more?
    (nuts_used_per_transport < town.nuts) && (nuts_used_per_transport < pile_of_nuts.nuts)
  end

  def nuts_used_per_transport
    nuts_used_per_transport ||= fuel_consumption * pile_of_nuts.distance_from_town
  end
end
