require 'tempfile'
require 'fileutils'
require 'find'

# Class for reading an writting files
class Archiver
  attr_accessor :file

  @@modes = %i[reader writer both]

  @@modes.each do |mode|
    define_method("open_file_as_#{mode}") do |file|
      @file = File.open(file, 'r') if mode == :reader
      @file = File.open(file, 'w') if mode == :writer
      @file = File.open(file, 'r+') if mode == :both
    end
  end

  def read_file(lines: false)
    lines ? file&.read : file&.readlines.map(&:chomp)
  end

  def write_file(data: nil, append: true)
    append ? File.write(file, data, mode: 'a') : File.write(file, data)
  end

  def censored_file
    lines = read_file
    arr = []
    lines.each { |line| arr.push('*' * line.length) }
    write_file data: '', append: false

    (0..arr.length - 1).each do |i|
      write_file data: "#{arr[i]}\n", append: true
    end
  end

  def counting_words
    lines = read_file

    lines.each do |line|
      words = line.split(' ')
      letters = words.map(&:length).inject(:+)
      puts "This line has #{words.length} words and #{letters} letters"
    end
  end
end

# Reading a file using tempfile
# file = Tempfile.new('foo')
# p file.path      # => A unique filename in the OS's temp directory,
# file.write("hello world")
# file.rewind
# p file.read      # => "hello world"
# file.close
# file.unlink    # deletes the temp file

a = Archiver.new
file = a.open_file_as_both('one.txt')
a.counting_words
file.close
a.open_file_as_reader('one.txt')
a.censored_file
