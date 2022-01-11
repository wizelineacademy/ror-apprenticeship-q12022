require_relative 'environment'

class Game
  attr_accessor :depot, :control
  include Environment

  def initialize
    @depot = Environment::Depot.new
    @control = Environment::Control.new
    @human = Environment::Human.new
    @worker = Environment::Worker.new
  end

  def new_mission(params)
    @control.new_mission(params)
  end 
end 

# Testing depot
game = Game.new
puts "----Testing depot----"
puts game.depot.packs[:simple_transportation_pack]
puts game.depot.packs[:standard_mission_pack]
puts game.depot.packs[:standard_mission_pack][:items]

# Testing new_mission
name = :alpha
objective = 'Get Alpha to the base'
pack = :simple_transportation_pack

game.new_mission name: name, objective: objective, pack: game.depot.packs[pack]
puts "----Testing new_mission----"
puts game.control.missions[:alpha]

# Testing set_mission_to_accomplished
game.control.set_mission_to_accomplished(:alpha)
puts "----Testing set_mission_to_accomplished----"
puts game.control.missions[:alpha]
