# frozen_string_literal: true

require_relative 'enviroment'

# Class ErrorTest
class ErrorTest
  include Enviroment

  attr_accessor :board, :depot, :control

  def initialize
    @board = { players: {}, control: {}, status: nil }
    @control = Enviroment::Control.new
  end

  def new_worker(name: nil)
    error = []
    raise StandardError, error.append('No name for worker given') if name.nil?
    raise StandardError, error.append('Input is not a String') unless name.instance_of? String
    raise StandardError, error.append('Input is too short') unless name.size > 4

    @board[:players].store name, Enviroment::Worker.new(name: name)
  rescue StandardError => e
    puts e
  end
end

# Testing of ErrorTesting class
worker = ErrorTest.new
worker.new_worker(name: 'a')
# p worker
