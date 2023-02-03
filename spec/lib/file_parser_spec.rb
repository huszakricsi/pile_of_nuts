require 'file_parser'

describe FileParser do
  let (:expected_result) do
    [
      [1000, 3000, 1, 1000],
      [1000, 100000, 1, 1000],
      [10000, 1111111, 3, 1111],
      [1000, 12000, 5, 3000]
    ]
  end

  it 'Parse files correctly' do
    result = FileParser.parse('./spec/resources/test_data.txt')
    expect(result).to eq expected_result
  end
end
