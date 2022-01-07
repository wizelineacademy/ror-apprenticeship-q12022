require_relative 'enviroment'
class Game
  attr_accessor :depot

  include Enviroment

  def initialize
    @depot = Enviroment::Depot.new
  end

  def test
    Enviroment::Depot.packs
  end
end

game = Game.new

p game.depot.packs[:standard_transportation_pack]
