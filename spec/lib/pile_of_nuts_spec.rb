require 'pile_of_nuts'

describe PileOfNuts do
  it 'Should initialize with the correct values' do
    pile_of_nuts = PileOfNuts.new(1,2)
    expect(pile_of_nuts.distance_from_town).to eq 1
    expect(pile_of_nuts.nuts).to eq 2
  end

  it 'Can take nuts from' do
    pile_of_nuts = PileOfNuts.new(1,3)
    expect(pile_of_nuts.nuts).to eq 3
    expect(pile_of_nuts.take_possible_nuts(2)).to eq 2
    expect(pile_of_nuts.nuts).to eq 1
  end

  it 'Can take exactly all nuts from' do
    pile_of_nuts = PileOfNuts.new(1,3)
    expect(pile_of_nuts.nuts).to eq 3
    expect(pile_of_nuts.take_possible_nuts(3)).to eq 3
    expect(pile_of_nuts.nuts).to eq 0
  end

  it 'Can take all nuts but not more' do
    pile_of_nuts = PileOfNuts.new(1,3)
    expect(pile_of_nuts.nuts).to eq 3
    expect(pile_of_nuts.take_possible_nuts(4)).to eq 3
    expect(pile_of_nuts.nuts).to eq 0
  end
end
