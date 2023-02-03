class Town
  attr_accessor :nuts

  def initialize
    self.nuts = 0
  end

  def add_nuts(amount)
    self.nuts += amount
  end

  def take_nuts(amount)
    if amount > self.nuts
      raise 'Not enough nuts in town'
    end

    self.nuts -= amount
    amount
  end
end
