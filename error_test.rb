# frozen_string_literal: true

require_relative 'environment'

# Class to test errors
class ErrorTest
  include Environment
  attr_accessor :board, :depot, :control, :dictionary, :poker

  def initialize
    @board = { players: {}, control: {}, status: nil }
    @control = Environment::Control.new
  end

  def new_worker(name: nil)
    @board[:players].store name, Environment::Worker.new(name)
  rescue NoMethodError
    puts 'No name for worker given'
  end

  def set_worker_data(name, type, data)
    @board[:players][name].send("set_#{type}_data", data)
  rescue NoMethodError
    puts 'Worker or type of data not found'
  end

  def estimate_payment_extra_hours(worker, hours)
    base_payment = @board[:players][worker].standard_shift[:payment]
    base_payment * hours
  rescue TypeError
    puts 'Hours must be of type Integer'
  end
end

e = ErrorTest.new
test = e.new_worker
p test
ana = e.new_worker(name: :Ana)
p ana
e.set_worker_data :ana, 'personal', { surname: 'Porras', age: 27 }
p ana
ana.initialize_shifts
p ana
begin
  e.estimate_payment_extra_hours
rescue ArgumentError
  puts 'Wrong number of arguments'
end
e.estimate_payment_extra_hours :Ana, '9'
