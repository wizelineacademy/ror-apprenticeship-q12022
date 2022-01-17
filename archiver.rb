# require 'tempfile'
# require 'utils'
# require 'find'

class Archiver
  attr_accessor :file
  @@modes = [:read, :write, :both]

  @@modes.each do |mode|
    define_method("open_file_as_#{mode}") do |file|
      @file = File.open(file, 'r') if mode == :read
      @file = File.open(file, 'w') if mode == :write
      @file = File.open(file, 'r+') if mode == :both
    end
  end

  def read_file line: false
    if line == false
      p @file.read(&:chomp)
    else
      p @file.readlines.map(&:chomp)
    end
    @file.close
  end

  def write_file data, append: true
    if append
      File.write(@file, data, mode:'a')
    else
      File.write(@file, data)      
    end
    @file.close
  end
  
end


a = Archiver.new

# a.open_file_as_read("./test.txt")
# a.read_file() #outputs "sun qwe\nasd iop\nzxc bnm" in console
# a.read_file(line: true) #outputs ["sun qwe", "asd iop", "zxc bnm"] in console

# a.open_file_as_both("./test.txt")
# a.write_file("sun") #outputs "sun" in the txt file
# a.write_file("moon", append: false) #outputs "moon" in the txt file

a.open_file_as_write("./test.txt")
#a.read_file() #outputs Error because not opened for reading
#a.write_file("sun", append: false) #outputs "sun" in the txt file
