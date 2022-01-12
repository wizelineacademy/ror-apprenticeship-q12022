require_relative 'environment'

class Game 
  attr_accessor :depot, :control
  include Environment

  def initialize
    @board = { payers: {}, control: {}, status: nil}
    @depot = Environment::Depot.new
    @control = Environment::Control.new
  end

  def new_worker(name:)
    worker = Environment::Worker.new(name:name, personal_data: nil,  professional_data: nil)
    @board[:payers[name]] = worker

  end

  def new_mission(name:, objective: , pack: )

    @control.new_mission(name:name, objective:objective, pack:pack)
  end

end

game = Game.new


#TESTS

# => game.depot.packs[:simple_transportation_pack]
# => game.depot.packs[:standard_mission_pack]
# => game.depot.packs[:standard_mission_pack][:items]

# => diego = game.new_worker name: 'Diego'
# => diego.set_personal_data surname: 'Mota', age: 40, marital_status: :single, children: 0, country: :mx, language: :es
# => diego.set_professional_data position: 'SE', occupation: 'IT', skills: [:ruby, :blender], observations: 'none'
# => puts "#{diego.name}, #{diego.class}", diego.personal_data, diego.professional_data

# => Diego, Environment::Worker
# => {:surname=>Mota”, :age=>40, :country=>:mx, :language=>:es, :marital_status=>:single, :children=>0}
# => {:position=>"SE", :occupation=>"IT", :skills=>[:ruby, :blender], :observations=>"none"}

# => name = :alpha; objective = 'Get Alpha to the base'; pack = :simple_transportation_pack
# => game.new_mission name: name, objective: objective, pack: game.depot.packs[pack]
# => puts game.control.missions[:alpha]
# => game.control.set_mission_to_accomplished(:alpha) and puts game.control.missions[:alpha]

# => {:objective=>"Get Alpha to the base", :status=>:active, :pack=>{:intelligence=>[:cellphone], :items=>[:medipack, :chevy_versa]}}
# => {:objective=>"Get Alpha to the base", :status=>:accomplished, :pack=>{:intelligence=>[:cellphone], :items=>[:medipack, :chevy_versa]}}
