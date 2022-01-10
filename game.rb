require './environment.rb'

class Game
    include Environment
    attr_accessor :board, :depot, :control, :dictionary
    def initialize
        @board = {
            :players =>{},
            :control =>{},
            :status => nil
        }
        @depot = Environment::Depot.new
        @control = Environment::Control.new
        @dictionary = Environment::Dictionary.new
    end

    def new_worker(name:)
        worker = Environment::Human::Worker.new(name: name)
        @board[:players][name] = worker
    end

    def new_mission(name:, objective:, pack:)
        @control.new_mission(name: name, objective: objective, pack: pack)
        @board[:control][:missions] = @control.missions
    end
end

game = Game.new 
p game.depot.packs[:simple_transportation_pack]
p game.depot.packs[:standard_mission_pack]
p game.depot.packs[:standard_mission_pack][:items]


diego = game.new_worker(name: 'Diego')
diego.set_personal_data(surname: 'Mota', age: 40, marital_status: :single, children: 0, country: :mx, language: :es)
diego.set_professional_data(position: 'SE', occupation: 'IT', skills: [:ruby, :blender], observations: 'none')
puts "#{diego.name}, #{diego.class}", diego.personal_data, diego.professional_data


name = :alpha; objective = 'Get Alpha to the base'; pack = :simple_transportation_pack
game.new_mission(name: name, objective: objective, pack: game.depot.packs[pack])
puts game.control.missions[:alpha]
game.control.set_mission_to_accomplished(:alpha)
puts game.control.missions[:alpha]


p hello = game.dictionary.say_hello(:es)
p my_name_is = game.dictionary.say_my_name_is(:es)
p i_come_from = game.dictionary.say_i_come_from(:es)
p goodbye = game.dictionary.say_goodbye(:es)