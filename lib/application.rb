class Application

  attr_accessor :header, :spacing

  def initialize(pretty_headers = false, spacing = 20)
    if pretty_headers || ENV['PRETTY_HEADERS']
      self.header = ["Distance", "Nuts", "Fuel consumption", "Capacity", "Result"]
    else
      self.header = %w[D N F C X]
    end
    self.spacing = spacing
  end

  def display_and_calculate_file(path)
    calculations = calculate_file(path)
    Displayer.new(spacing).display(calculations, header)
  end

  private

  def calculate_file(path)
    inputs = FileParser.parse(path)
    calculations = Calculator.calculate_multiple(inputs)
    calculations
  end

end

if input_path = ENV['INPUT_PATH']
  pretty_headers = !!ENV['PRETTY_HEADERS']
  spacing = ENV['SPACING'].to_i
  spacing = 20 unless ENV['SPACING']

  Application.new(pretty_headers, spacing).display_and_calculate_file(input_path)
end
