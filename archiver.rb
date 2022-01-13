require 'tempfile'
require 'fileutils'
require 'find'

class Archiver
  attr_accessor :file
  @@modes = [:reader, :writer, :both, :write_start]

  @@modes.each do |mode|
    define_method("open_file_as_#{mode}") do |file|
      @file = File.open(file, 'r') if mode == :reader
      @file = File.open(file, 'w') if mode == :writer
      @file = File.open(file, 'r+') if mode == :both
    end
  end

  def read_file lines: false
    lines ? data = @file&.read : data = @file&.readlines.map(&:chomp)
  end

  def write_file data: nil, append: true
    append ? File.write(@file, data, mode: "a") : File.write(@file, data)
  end  

  def close 
    @file.close
  end
end


file = Archiver.new

file.open_file_as_writer("info.txt")
file.write_file(data: "Hi, my name Jocelyne")
file.close

file.open_file_as_reader("info.txt")
p file.read_file(lines: true)
file.close

file.open_file_as_both("info.txt")
file.write_file(data: "Hi, my name John", append: false)
p file.read_file(lines: true)
file.write_file(data: "\nHola, soy Jossy")
file.close

file.open_file_as_reader("info.txt")
puts file.read_file(lines: true)
file.close
