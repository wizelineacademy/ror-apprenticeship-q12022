require_relative 'enviroment'

class ErrorTest
  include Enviroment
  attr_accessor :board, :depot, :control, :dictionary, :poker

  def initialize
    @board = { players: {}, control: {}, status: nil }
    @control = Enviroment::Control.new
    @depot = Enviroment::Depot.new
  end

  def new_worker(name: nil)
    @board[:players].store name, Enviroment::Worker.new(name)
  rescue ArgumentError
    puts 'No name for worker given'
  end

  def new_mission(**args)
    control.new_mission(**args)
  rescue ArgumentError
    puts 'Some arguments are missing from new_mission'
  end

  def set_mission_to(state:, name:)
    objective = 'Get Alpha to the base'
    pack = :simple_transportation_pack
    control.new_mission name: name, objective: objective, pack: depot.packs[pack]
    control.send "set_mission_to_#{state}".to_sym, name
  rescue NoMethodError
    puts "set_mission_to_#{state} is not defined"
  end
end

error_test = ErrorTest.new
# Missing name
error_test.new_worker
# Missing pack:
error_test.new_mission(name: :alpha, objective: 'test test')
# set_mission_to_win does not exists
error_test.set_mission_to(state: 'win', name: :alpha)
