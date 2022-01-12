require 'tempfile'
require 'fileutils'
require 'find'

class Archiver
  attr_accessor :file
  @modes = %i[reader writer both]

  def initialize
  end

  @modes.each do |mode|
    define_method("open_file_as_#{mode}") do |file|
      @file = File.open(file, 'r') if mode == :reader
      @file = File.open(file, 'w') if mode == :writer
      @file = File.open(file, 'r+') if mode == :both
    end
  end

  def create_file(path_file)
    File.new(path_file,'w') if !File.exist?(path_file)
  end

  def read_file(lines: false)
    lines ? data = self.file&.read : data = self.file&.readlines.map(&:chomp)
  end

  def write_file(data: nil, append: true)
    append ? File.write(self.file, data, mode: "a") : File.write(self.file, data)
  end  
end

#TEST
archiver = Archiver.new
archiver.create_file('test.txt')
archiver.open_file_as_both('test.txt')
archiver.write_file(data: 'Put this into a file each time.', append: true)
p archiver.read_file
