# frozen_string_literal: true

# Module for file manipulation, defined as module for expansion
module FileManager
  require 'tempfile'
  require 'fileutils'
  require 'find'
  # Class archiver for files management
  class Archiver
    attr_accessor :file, :modes

    @modes = %w[reader writer both write_start]
    # p "creating methods #{@modes}"

    @modes.each do |mode|
      define_method("open_file_as_#{mode}") do |file|
        @file = File.open(file, 'r') if mode.to_sym == :reader
        @file = File.open(file, 'w') if mode.to_sym == :writer
        @file = File.open(file, 'r+') if mode.to_sym == :both
      end
    end

    def write_file(data: nil, append: true)
      append ? File.write(@file, data, mode: 'a') : File.write(@file, data)
    end

    def read_file(lines: false)
      lines ? file.read : file.readlines.map(&:chomp)
    end

    def close
      @file.close
    end
  end
end

# Create new instance
file = FileManager::Archiver.new

# Testing append default 
file.open_file_as_writer('test.txt')
file.write_file(data: 'testing archiver class')
file.close

file.open_file_as_writer('test.txt')
file.write_file(data: 'testing archiver class line 2')
file.close

file.open_file_as_reader('test.txt')
p file.read_file(lines: false)
file.close

file.open_file_as_writer('test.txt')
file.write_file(data: 'Removed everything!', append: false)
file.close

file.open_file_as_reader('test.txt')
puts file.read_file(lines: true)
file.close
