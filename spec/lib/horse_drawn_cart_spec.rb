require 'horse_drawn_cart'

describe HorseDrawnCart do
  it 'Should initialize with the correct values and objects' do
    horse_drawn_cart = HorseDrawnCart.new(5,25,1,15)
    expect(horse_drawn_cart.pile_of_nuts.distance_from_town).to eq 5
    expect(horse_drawn_cart.pile_of_nuts.nuts).to eq 25 
    expect(horse_drawn_cart.fuel_consumption).to eq 1 
    expect(horse_drawn_cart.capacity).to eq 15 
    expect(horse_drawn_cart.nuts_in_cart).to eq 0
  end

  it 'nuts_in_town method returns nuts in town' do
    horse_drawn_cart = HorseDrawnCart.new(5,25,1,15)
    horse_drawn_cart.town.nuts = 3
    expect(horse_drawn_cart.nuts_in_town).to eq 3
  end

  context 'take_possible_nuts! method' do
    it 'protected by cart capacity guard, and no nuts being taken' do
      horse_drawn_cart = HorseDrawnCart.new(5,25,1,1)
      expect{ horse_drawn_cart.take_possible_nuts! }.to raise_error(RuntimeError, 'No nuts can be taken to town: consumption is bigger than cart capacity')
      expect(horse_drawn_cart.nuts_in_town).to eq 0
    end

    it 'protected by nuts guard, and no nuts being taken' do
      horse_drawn_cart = HorseDrawnCart.new(5,2,1,33)
      expect{ horse_drawn_cart.take_possible_nuts! }.to raise_error(RuntimeError, 'No nuts can be taken to town: consumption is bigger than takeable nuts')
      expect(horse_drawn_cart.nuts_in_town).to eq 0
    end

    it 'takes nuts from pile to town' do
      horse_drawn_cart = HorseDrawnCart.new(2,30,1,10)
      horse_drawn_cart.take_possible_nuts!
      expect(horse_drawn_cart.nuts_in_town).to eq 20
    end
  end

  it 'transport method consumes nuts by consumption * distance' do
    horse_drawn_cart = HorseDrawnCart.new(6,45,1,15)
    horse_drawn_cart.nuts_in_cart = 10
    horse_drawn_cart.send(:transport)
    expect(horse_drawn_cart.nuts_in_cart).to eq 4
  end

  it 'take_nuts_from_pile reduces piles nuts amount and puts them to cart' do
    horse_drawn_cart = HorseDrawnCart.new(6,45,1,15)
    horse_drawn_cart.send(:take_nuts_from_pile, 15)
    expect(horse_drawn_cart.nuts_in_cart).to eq(15)
    expect(horse_drawn_cart.pile_of_nuts.nuts).to eq 30
  end

  it 'take_nuts_from_town reduces towns nuts amount and puts them to cart' do
    horse_drawn_cart = HorseDrawnCart.new(6,45,1,15)
    horse_drawn_cart.town.nuts = 15
    horse_drawn_cart.send(:take_nuts_from_town, 15)
    expect(horse_drawn_cart.nuts_in_cart).to eq 15
    expect(horse_drawn_cart.town.nuts).to eq 0
  end

  it 'put_down_nuts_at_town reduces cart nuts amount and puts them to town' do
    horse_drawn_cart = HorseDrawnCart.new(6,45,1,15)
    horse_drawn_cart.nuts_in_cart = 15
    horse_drawn_cart.send(:put_down_nuts_at_town)
    expect(horse_drawn_cart.nuts_in_cart).to eq 0
    expect(horse_drawn_cart.town.nuts).to eq 15
  end
  
  context 'can_take_more?' do
    it 'returns true if its worth to go one more round' do
      horse_drawn_cart = HorseDrawnCart.new(6,45,1,15)
      horse_drawn_cart.town.nuts = 10
      expect(horse_drawn_cart.send(:can_take_more?)).to eq true
    end

    it 'returns false if its worth to go one more round because of nuts in town' do
      horse_drawn_cart = HorseDrawnCart.new(6,45,1,15)
      horse_drawn_cart.town.nuts = 1
      expect(horse_drawn_cart.send(:can_take_more?)).to eq false
    end
    
    it 'returns false if its worth to go one more round because of nuts at pile' do
      horse_drawn_cart = HorseDrawnCart.new(6,1,1,15)
      horse_drawn_cart.town.nuts = 1000
      expect(horse_drawn_cart.send(:can_take_more?)).to eq false
    end
  end

  it 'nuts_used_per_transport method returns the amount of nuts that will be consumed during transport' do
    distance = 10
    consumption = 3
    horse_drawn_cart = HorseDrawnCart.new(distance,45,consumption,15)
    expect(horse_drawn_cart.send(:nuts_used_per_transport)).to eq(distance * consumption)
  end
end
