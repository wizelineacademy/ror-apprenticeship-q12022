# frozen_string_literal: true

require_relative 'enviroment'

# class Game
class Game
  include Enviroment

  attr_accessor :depot, :control

  def initialize
    @depot = Enviroment::Depot.new
    @control = Enviroment::Control.new
  end

  def new_mission(name: 'default', objective: 'default', pack: :default)
    @control.new_mission(name: name, objective: objective, pack: pack)
  end
end

# XC:Code tesing
game = Game.new
p game.depot.packs[:simple_transportation_pack]
name = :alpha
objective = 'Get Alpha to the base'
pack = :simple_transportation_pack
# p game.new_mission # --> trying default values
game.new_mission name: name, objective: objective, pack: game.depot.packs[pack]
game.control.set_mission_to_accomplished(:alpha)
puts game.control.missions[:alpha]

diego = game.new_worker name: 'Diego'
personal_data = { surname: 'Mota', age: 40, marital_status: :single, children: 0, country: :mx, language: :es }
professional_data = { position: 'SE', occupation: 'IT', skills: %i[ruby blender], observations: 'none' }
diego.set_personal_data personal_data
diego.set_professional_data professional_data
puts "#{diego.name}, #{diego.class}", diego.personal_data, diego.professional_data
