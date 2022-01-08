require_relative 'enviroment'
class Game
  attr_accessor :depot, :control

  include Enviroment

  def initialize
    @depot = Enviroment::Depot.new
    @control = Enviroment::Control.new
  end

  def test
    Enviroment::Depot.packs
  end
end

game = Game.new

name = :alpha
objective = 'Get Alpha to the base'
pack = :simple_transportation_pack
game.control.new_mission(name: name, objective: objective, pack: pack)
p game.control.missions[:alpha]
game.control.set_mission_to_paused(:alpha)
p game.control.missions[:alpha]
