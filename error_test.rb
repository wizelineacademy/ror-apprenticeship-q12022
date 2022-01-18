require_relative 'environment'

class ErrorTest
  include Environment
  attr_accessor :board, :depot, :control, :dictionary, :poker

  def initialize
    @board = { players: {}, control: {}, status: nil }
    @control = Environment::Control.new
    @depot = Environment::Depot.new
  end

  # Error catching altered
  def new_worker(name: nil)
    p name
    @board[:players].store name, Environment::Worker.new(name)
    p board
  rescue ArgumentError => e
    puts e
    puts 'Exception: No name for worker given'
  end

  # Error catching number 1
  def new_mission(name, objective, pack)
    depot.packs.keys.include? pack ? nil : raise(ArgumentError)
    @control.new_mission(name, objective, pack)
  rescue ArgumentError
    puts 'Exception: That pack does not exist in Depot!'
  end

  def set_mission_to_accomplished(mission)
    control.missions.keys.include? mission ? nil : raise(NoMethodError)
  rescue NoMethodError
    p 'Exception: That mission is not part of this game'
  end

  def get_missions
    control.missions.keys
  end
end

error_test = ErrorTest.new

human = error_test.new_worker

name = :alpha
objective = 'Get alpha to the base'
pack = 'Super duper!'

error_test.new_mission(name, objective, error_test.depot.packs[pack])

pack = :simple_trasportation_pack
error_test.new_mission(name, objective, error_test.depot.packs[pack])
puts error_test.control.missions.keys.include?(:beta)

error_test.control.set_mission_to_accomplished(:alpha)

# Error catching number 2
begin
  error_test.control.set_mission_to_accomplished :beta
rescue NoMethodError => e
  puts e.message
  puts 'Exception: That mission does not exist!'
end

puts 'Terminated program successfully'
