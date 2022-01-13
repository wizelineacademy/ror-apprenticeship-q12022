# frozen_string_literal: true

require_relative 'environment'

class Game
  attr_accessor :depot, :control, :board

  include Environment

  def initialize
    @board = {
      players: {},
      control: {},
      status: nil
    }
    @depot = Environment::Depot.new
    @control = Environment::Control.new
  end

  def new_worker(name: name)
    @board[name] = Environment::Worker.new(name)
  end

  def new_mission(params)
    @control.new_mission(params)
    @board[:control] = {
      missions: @control.missions
    }
  end
end

# Testing depot
game = Game.new
puts '----Testing depot----'
puts game.depot.packs[:simple_transportation_pack]
puts game.depot.packs[:standard_mission_pack]
puts game.depot.packs[:standard_mission_pack][:items]

# Testing new_mission
name = :alpha
objective = 'Get Alpha to the base'
pack = :simple_transportation_pack

game.new_mission name: name, objective: objective, pack: game.depot.packs[pack]
puts '----Testing new_mission----'
puts game.control.missions[:alpha]

# Testing set_mission_to_accomplished
game.control.set_mission_to_accomplished(:alpha)
puts '----Testing set_mission_to_accomplished----'
puts game.control.missions[:alpha]

# Testing new_worker and set_data
diego = game.new_worker name: 'Diego'
diego.set_personal_data surname: 'Mota', age: 40, marital_status: :single, children: 0, country: :mx, language: :es
diego.set_professional_data position: 'SE', occupation: 'IT', skills: %i[ruby blender], observations: 'none'
puts '----Testing new_worker----'
puts "#{diego.name}, #{diego.class}", diego.personal_data, diego.professional_data
