require 'calculator'

describe Calculator do
  let (:multiple_input) do
    [
      [2,30,1,10],
      [3,320,2,100]
    ]
  end  
  let (:expected_calculations) do
    [
      {:input=>[2, 30, 1, 10], :result=>20},
      {:input=>[3, 320, 2, 100], :result=>278}
    ]
  end

  it 'self.calculate method should calculate a case' do
    result = Calculator.calculate(2,30,1,10)
    expect(result).to eq(20)
  end

  it 'self.calculate_multiple method calculates multiple cases' do
    calculations = Calculator.calculate_multiple(multiple_input)
    expect(calculations).to eq(expected_calculations)
  end

end
