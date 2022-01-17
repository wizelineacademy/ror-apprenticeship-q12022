# frozen_string_literal: true

require_relative 'environment'

# Game class
class Game
  include Environment

  attr_accessor :board, :depot, :control

  def initialize
    @board = { players: {}, control: {}, status: nil }
    @depot = Environment::Depot.new
    @control = Environment::Control.new
  end

  def new_worker(name)
    @board[:players].store name, Environment::Worker.new(name)
  end

  def new_mission(name, objective, pack)
    @control.new_mission(name, objective, pack)
  end
end

game = Game.new
diego = game.new_worker('Diego')
personal_data = { surname: 'Mota', age: 40, country: :mx, language: :es, marital_status: :single, children: 0 }
professional_data = { position: 'SE', occupation: 'IT', skills: %i[ruby blender], observations: 'none' }

diego.set_personal_data(personal_data)
diego.set_professional_data(professional_data)
puts "#{diego.name}, #{diego.class}", diego.personal_data, diego.professional_data

name = :alpha
objective = 'Get alpha to the base'
pack = :simple_trasportation_pack

game.new_mission(name, objective, game.depot.packs[pack])
puts game.control.missions[:alpha]
game.control.set_mission_to_accomplished(name)
puts game.control.missions[name]
