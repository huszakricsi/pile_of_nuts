class Displayer
  attr_accessor :spacing
  def initialize(spacing = 20)
    self.spacing = spacing
  end

  def display(calculations, header = nil)
    display_header(header) if header
    display_calculations(calculations)
  end

  private

  def display_header(header)
    formatted_header = format_array_to_line(header)
    puts formatted_header
  end

  def display_calculations(calculations)
    calculations.each do |calculation|
      justified_inputs = format_array_to_line(calculation[:input])
      line  = justified_inputs
      line += calculation[:result].to_s
      puts line
    end
  end

  def format_array_to_line(array)
    spaced_array = array.map{|element| element.to_s.ljust(spacing)}
    spaced_array.join
  end
end
