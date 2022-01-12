require_relative 'environment.rb'

class ErrorTest
  include Environment
  attr_accessor :board, :depot, :control, :dictionary, :poker

  def initialize
    @board = { players: Hash.new, control: Hash.new, status: nil }
    @control = Environment::Control.new
    @depot = Environment::Depot.new
    @dictionary = Environment::Dictionary.new
  end

  def new_worker name: nil
    begin    
      raise StandardError, "Is not posible to have a null name" if name.nil?
      raise StandardError, "Is not posible to have an empty name"if name.empty?
      worker = Environment::Human::Worker.new(name: name)
      @board[:players][name] = worker
    rescue StandardError => e
        puts "Error: #{e.message}"
    end
  end

  def new_mission name: nil, objective: nil, pack: nil
    begin
      error_message = ""
      if name.nil?
        error_message = "Name is null. "
      end
      if objective.nil?
        error_message += "Objective is null. "
      end
      if pack.nil? 
        error_message += "Pack is null. "
      end
      unless error_message.empty?
        raise StandardError, error_message
      end
      @control.new_mission(name: name, objective: objective, pack: pack)
      @board[:control][:missions] = @control.missions
    rescue StandardError => e
      puts "Error: #{e.message}"
    end
  end

  def say_hello(lang)
    begin
      raise StandardError, "Is not posible to have a null lang" if lang.nil?
      unless [:en, :es, :cz].include?(lang)
        raise StandardError, "Lang is not supported"
      end
      @dictionary.say_hello(lang)
    rescue StandardError => e
      puts "Error: #{e.message}"
    end
  end
end

#TEST
error = ErrorTest.new
#Error case:
p "ERROR CASE FOR NEW WORKER:"
error.new_worker
p '----------------------------------------------------------------------------------------------------------------'
#Good case:
p "GOOD CASE FOR NEW WORKER:"
diego = error.new_worker(name: 'Diego')
diego.set_personal_data(surname: 'Mota', age: 40, marital_status: :single, children: 0, country: :mx, language: :es)
diego.set_professional_data(position: 'SE', occupation: 'IT', skills: [:ruby, :blender], observations: 'none')
puts "#{diego.name}, #{diego.class}", diego.personal_data, diego.professional_data
p '----------------------------------------------------------------------------------------------------------------'
#Error case:
p "ERROR CASE FOR NEW MISSION:"
error.new_mission
error.new_mission(name: "hola")
error.new_mission(name: "hola", pack: error.depot.packs[:standard_mission_pack])
p '----------------------------------------------------------------------------------------------------------------'
#Good case:
p "GOOD CASE FOR NEW MISSION:"
name = :alpha; objective = 'Get Alpha to the base'; pack = :simple_transportation_pack
p error.new_mission(name: name, objective: objective, pack: error.depot.packs[pack])
p '----------------------------------------------------------------------------------------------------------------'
#Error case:
p "ERROR CASE FOR DICTIONARY:"
error.say_hello(nil)
error.say_hello(:de)
p '----------------------------------------------------------------------------------------------------------------'
#Good case:
p "GOOD CASE FOR DICTIONARY:"
p error.say_hello(:cz)