require 'displayer'

describe Displayer do
  include_context 'stdout'

  let (:header) { ["Distance", "Nuts", "Fuel consumption", "Capacity", "Result"] }
  let (:calculations) do
    [
      {:input=>[2, 30, 1, 10], :result=>20},
      {:input=>[3, 320, 2, 100], :result=>278}
    ]
  end
  let (:expected_output) do
    [
      "DistanceNutsFuel consumptionCapacityResult",
      "23011020",
      "33202100278"
    ]
  end

  it 'Displays header and calculations correctly' do
    displayer = Displayer.new(0)
    displayer.display(calculations, header)
    stdout.rewind
    lines = stdout.string.split("\n")
    expect(lines).to eq expected_output
  end
end
