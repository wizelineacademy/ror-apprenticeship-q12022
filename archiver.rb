# frozen_string_literal: true

class Archiver
  attr_accessor :file

  @modes = %i[reader writer both]

  @modes.each do |mode|
    define_method("open_file_as_#{mode}") do |file_name|
      @file = File.open(file_name, 'r') if mode == :reader
      @file = File.open(file_name, 'w') if mode == :writer
      @file = File.open(file_name, 'r+') if mode == :both
    end
  end

  def read_file(lines: false)
    lines ? file&.read : file.readlines.map(&:chomp)
  end

  def write_file(data: nil, append: true)
    append ? File.write(file, data, mode: 'a') : File.write(file, data)
  end
end

archiver = Archiver.new
archiver.open_file_as_both('example.txt')
archiver.write_file(data: 'hello, I am a little file', append: true)
p archiver.read_file
archiver.file.close
