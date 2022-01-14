class Archiver
  attr_accessor :file
  def initialize
  end
@@modes = [:read, :write, :read_write]
  @@modes.each do |mode|
    define_method("open_file_as_#{mode}") do |file|
      case mode
        when :read
          @file = File.open(file, 'r')
        when :write
          @file = File.open(file, 'w')
        when :read_write
          @file = File.open(file, 'r+')
      end
    end
  end

  #whole file or  line by line
  def read byLines: false
    if byLines
      data = @file&.read
    else
      data = file&.readlines.map(&:chomp)
    end
  end

  def write text: nil, append: false
    if append
      File.write(@file, text, mode: "a")
    else
      File.write(@file, text)
    end
  end

  def close
    @file.close
  end
end

# Reading a file using tempfile
file = Archiver.new
file.open_file_as_read("test.txt")
puts "Original Content:",file.read
file.open_file_as_read_write("test.txt")
file.write( text: "Lorem ipsum dolor sit amet, Aenean commodo ligula eget dolor.
  Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes,
  nascetur ridiculus mus. Donec quam felis." )
p "New Content:",file.read(byLines: true)
file.close
