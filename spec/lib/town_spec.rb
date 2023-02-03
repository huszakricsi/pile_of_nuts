require 'town'

describe Town do
  it 'Should initialize with 0 initial nuts' do
    town = Town.new
    expect(town.nuts).to eq 0
  end

  it 'Nuts can be added' do
    town = Town.new
    expect(town.nuts).to eq 0
    town.add_nuts(5)
    expect(town.nuts).to eq 5
  end

  it 'Nuts can be removed' do
    town = Town.new
    town.nuts = 5
    town.take_nuts(3)
    expect(town.nuts).to eq 2
  end

  it 'Cant take more nuts than possible' do
    town = Town.new
    town.nuts = 5
    
    expect{ town.take_nuts(10) }.to raise_error(RuntimeError, 'Not enough nuts in town')

    expect(town.nuts).to eq 5
  end
end
