require 'application'

describe Application do

  context 'Initialize application' do
    let (:pretty_header) { ["Distance", "Nuts", "Fuel consumption", "Capacity", "Result"] }
    let (:normal_header) { %w[D N F C X] }

    it 'with pretty header' do
      application = Application.new(true)
      expect(application.header).to eq(pretty_header)
    end

    it 'with original header' do
      application = Application.new(false)
      expect(application.header).to eq(normal_header)
    end

    it 'with custom spacing' do
      application = Application.new(false, 2)
      expect(application.spacing).to eq(2)
    end
  end

  context 'display_and_calculate_file method' do 
    include_context 'stdout'
  
    let (:expected_output) { [ "DNFCX", "10003000110000", "1000100000110000", "100001111111311110", "100012000530000" ] }

    it 'display_and_calculate_file prints the calculations' do
      application = Application.new(false, 0)
      application.display_and_calculate_file('./spec/resources/test_data.txt')

      stdout.rewind
      lines = stdout.string.split("\n")

      expect(lines).to eq expected_output
    end
  end

  context 'calculate_file' do
    let (:expected_calculations) do
      [
        {:input=>[1000, 3000, 1, 1000], :result=>0},
        {:input=>[1000, 100000, 1, 1000], :result=>0},
        {:input=>[10000, 1111111, 3, 1111], :result=>0},
        {:input=>[1000, 12000, 5, 3000], :result=>0}
      ]
    end

    it 'calculate_file method reads file and creates calculations' do
      application = Application.new
      calculations = application.send(:calculate_file, './spec/resources/test_data.txt')
      expect(calculations).to eq(expected_calculations)
    end
  end
end
