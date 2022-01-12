require_relative 'environment.rb'
class  Game
  include Environment
  attr_accessor :board, :depot, :control
  def initialize
    @board = {players: {}, control: {}, status: nil}
    @depot = Environment::Depot.new
    @control = Environment::Control.new
  end

  def new_worker(name: nil)
    @board[:players][name.to_sym] = Environment::Worker.new(name)
  end

  def  new_mission(name: nil, objective: nil, pack: nil)
    @control.new_mission(name: name, objective: objective, pack: pack)
		@board[:control][:missions] =  @control.missions
  end
end

game = Game.new
diego = game.new_worker name: 'Diego'
diego.set_personal_data surname: 'Mota', age: 40, marital_status: :single, children: 0, country: :mx, language: :es
diego.set_professional_data position: 'SE', occupation: 'IT', skills: [:ruby, :blender], observations: 'none'
puts "#{diego.name}, #{diego.class}", diego.personal_data, diego.professional_data

# Mission control
name = :alpha; objective = 'Get Alpha to the base'; pack = :simple_transportation_pack
game.new_mission name: name, objective: objective, pack: game.depot.packs[pack]
puts game.control.missions[:alpha]
game.control.set_mission_to_accomplished(:alpha) and puts game.control.missions[:alpha]
