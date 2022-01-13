# frozen_string_literal: true

require_relative 'environment' # #mando a llamar el archivo

class Game
  attr_accessor :depot, :control, :human

  include Environment

  def initialize
    @depot = Environment::Depot.new
    @control = Environment::Control.new
    @human = Environment::Human.new
    @board = { players: {}, control: {}, status: nil }
  end

  def new_worker(name:)
    worker = Environment::Worker.new(name: name, personal_data: nil, professional_data: nil)
    @board[:payers[name]] = worker
  end

  def new_mission
    @control.new_mission(name: name, objective: objective, pack: pack)
  end
end

game = Game.new
p game.depot.packs[:simple_transportation_pack]
p game.depot.packs[:standard_mission_pack]
p game.depot.packs[:standard_mission_pack][:items]
p '--------------------------------------------------------'

name = :alpha
objective = 'Get Alpha to the base'
pack = :simple_transportation_pack
game.control.new_mission name: name, objective: objective, pack: game.depot.packs[pack]
puts game.control.missions[:alpha]
p '---------------------------------------------------------'

game.control.set_mission_to_accomplished(:alpha)
puts game.control.missions[:alpha]
p '---------------------------------------------------------'

diego = game.new_worker name: 'Diego'
diego.set_personal_data surname: 'Mota', age: 40, marital_status: :single, children: 0, country: :mx, language: :es
diego.set_professional_data position: 'SE', occupation: 'IT', skills: %i[ruby blender], observations: 'none'
puts "#{diego.name}, #{diego.class}", diego.personal_data, diego.professional_data
p '---------------------------------------------------------'

name = :alpha
objective = 'Get Alpha to the base'
pack = :simple_transportation_pack
game.new_mission name: name, objective: objective, pack: game.depot.packs[pack]
puts game.control.missions[:alpha]
game.control.set_mission_to_accomplished(:alpha)
puts game.control.missions[:alpha]