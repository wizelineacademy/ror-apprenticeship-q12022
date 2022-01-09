require_relative 'enviroment'
class Game
  attr_accessor :depot, :control

  include Enviroment

  def initialize
    @depot = Enviroment::Depot.new
    @control = Enviroment::Control.new
    @human = Enviroment::Human
  end
end

game = Game.new

name = :alpha
objective = 'Get Alpha to the base'
pack = :simple_transportation_pack
game.control.new_mission(name: name, objective: objective, pack: pack)
# p game.control.missions[:alpha]
# game.control.set_mission_to_paused(:alpha)
# p game.control.missions[:alpha]
human = Enviroment::Human.new(name: 'test', personal_data: 'test', professional_data: 'test')
p human
human.set_personal_data(surname: 'test', age: 2, country: 'test', language: 'test', marital_status: 'single', children: 4)