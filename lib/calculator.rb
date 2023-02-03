class Calculator

  def self.calculate(distance_from_town, nuts, fuel_consumption, capacity)
    horse_drawn_cart = HorseDrawnCart.new(distance_from_town, nuts, fuel_consumption, capacity)
    begin
      horse_drawn_cart.take_possible_nuts!
    rescue => e
      #No need for handling the exception since the requested use case
    end
    horse_drawn_cart.nuts_in_town
  end

  def self.calculate_multiple inputs
    inputs.map do |input|
      { input: input, result: calculate(*input) }
    end
  end
end
