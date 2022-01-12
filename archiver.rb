class Archiver
  attr_accessor :file
  @@modes = [:reader, :writer, :both]

  @@modes.each do |mode|
    define_method("open_file_as_#{mode}") do |file|
      @file = File.open(file, 'r') if mode == :reader
      @file = File.open(file, 'w') if mode == :writer
      @file = File.open(file, 'r+') if mode == :both
    end
  end

  def read_file lines: false
    lines ? data = self.file&.read : data = self.file&.readlines.map(&:chomp)
  end

  def write_file data: nil, append: true
    append ? File.write(self.file, data, mode: "a") : File.write(self.file, data)
  end  
end

# Testing
file = Archiver.new
file.open_file_as_both("test.txt")
file.write_file data: "Hey there! I'm testing my archiver class"
p file.read_file lines: true
