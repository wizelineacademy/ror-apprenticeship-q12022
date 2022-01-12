class Archiver
  attr_accessor :file

  { read: 'r', write: 'w', both: 'r+' }.each do |key, value|
    define_method("open_file_#{key}") { |file| @file = File.open file, value }
  end

  def read_file(lines: false)
    lines ? @file&.read : @file&.readlines.map(&:chomp)
  end

  def write_file(data: nil, append: true)
    append ? File.write(@file, data, mode: 'a') : File.write(file, data)
  end
end