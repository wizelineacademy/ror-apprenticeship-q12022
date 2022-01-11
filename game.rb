require_relative 'environment'

class Game
  attr_accessor :board, :depot, :control
  include Environment

  def initialize
    @board = {
      players: Hash.new,
      control: Hash.new,
      status: nil
    }
    @depot = Environment::Depot.new
    @control = Environment::Control.new
  end

  def new_worker(name:)
    worker = Environment::Worker.new(name:name, personal_data: nil, professional_data: nil)
    @board[:players].store(name, worker)
  end

  def new_mission(name:, objective:, pack:)
    @control.new_mission(name: name, objective: objective, pack:pack)
  end
end

#Testing
game = Game.new
diego = game.new_worker name: 'Diego'
diego.set_personal_data surname: 'Mota', age: 40, marital_status: :single, children: 0, country: :mx, language: :es
diego.set_professional_data position: 'SE', occupation: 'IT', skills: %i[ruby blender], observations: 'none'
#puts "#{diego.name}, #{diego.class}", diego.personal_data, diego.professional_data

name = :alpha
objective = 'Get Alpha to the base'
game.new_mission name: name, objective: objective, pack: game.depot.packs[:simple_transportation_pack]
#puts game.control.missions[:alpha]
game.control.set_mission_to_accomplished(:alpha)
#puts game.control.missions[:alpha]
