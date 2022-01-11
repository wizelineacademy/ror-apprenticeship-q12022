# frozen_string_literal: true

require 'tempfile'
require 'fileutils'
require 'find'

class Archiver
  attr_accessor :file

  @@modes = %i[reader writer both]

  def initialize; end

  @@modes.each do |mode|
    define_method("open_file_as_#{mode}") do |file|
      @file = File.open(file, 'r') if mode == :reader
      @file = File.open(file, 'w') if mode == :writer
      @file = File.open(file, 'r+') if mode == :both
    end
  end

  def read_file(lines: false)
    data = lines ? file&.read : file&.readlines.map(&:chomp)
  end

  def write_file(data: nil, append: true)
    append ? File.write(file, data, mode: 'a') : File.write(file, data)
  end
end

# archiver = Archiver.new
# archiver.open_file_as_both "lines.txt"
# archiver.write_file data: "line 4", append: true
# p archiver.read_file
