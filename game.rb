# frozen_string_literal: true

require_relative 'environment'

# Class to test game
class Game
  attr_accessor :board, :depot, :control

  def initialize
    @board = { players: {}, control: {}, status: nil }
    @depot = Environment::Depot.new
    @control = Environment::Control.new
  end

  def new_worker(name:)
    @board[:players].store(name, Environment::Worker.new(name))
  end

  def new_mission(name:, objective:, pack:)
    @control.new_mission(name:name, objective: objective, pack: pack)
    @board[:control][:missions] = @control.missions
    # @board[:control].store(:missions, @control.missions)
  end
end

game = Game.new
fanny = game.new_worker name: 'Fanny'
fanny.set_personal_data surname: 'Porras', age: 27, matiral_status: :single, children: 0, country: :mx, language: :es
fanny.set_professional_data position: 'SE', occupation: 'IT', skills: [:javascript, :react], observations: 'none'
puts "#{fanny.name}, #{fanny.class}", fanny.personal_data, fanny.professional_data

name = :beta
objective = 'Rescue king'
pack = game.depot.packs[:simple_transportation_pack]
game.new_mission name: name, objective: objective, pack: pack
puts game.control.missions[:beta]
game.control.set_mission_to_accomplished(:beta) and puts game.control.missions[:beta]
