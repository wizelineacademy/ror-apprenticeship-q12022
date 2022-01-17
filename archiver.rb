class Archiver
  attr_accessor :file
  @@modes = %i[reader writer both]

  @@modes.each do |mode|
    define_method("open_file_as_#{mode}") do |file|
      @file = File.open(file, "r") if mode == :reader
      @file = File.open(file, "w") if mode == :writer
      @file = File.open(file, "r+") if mode == :both
    end
  end

  def read_file lines: false
    lines ? file.read : file.readlines.map(&:chomp)
  end

  def write_file data: nil, append: true
    append ? File.write(file, data, mode: "a") : File.write(file, data)
  end  
end

=begin
# Reading a file using new code
test = Archiver.new
test.open_file_as_both("testing_text.txt")
test.write_file(data: "Still testing", append: true)
p test.read_file
test.file.close
=end

=begin
# Reading a file using original code given
file = Tempfile.new('foo')
file.path      # => A unique filename in the OS's temp directory,
file.write("hello world")
file.rewind
file.read      # => "hello world"
file.close
file.unlink    # deletes the temp file
=end