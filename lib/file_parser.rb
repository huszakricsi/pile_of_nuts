class FileParser
  def self.parse(path)
    lines = File.readlines(path)
    lines.map do |line|
      line.split(',').map(&:to_i)
    end
  end
end
