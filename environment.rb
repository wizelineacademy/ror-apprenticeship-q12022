=begin
      # define_method("set_mission_to_#{state}".to_sym) do |mission|
      #   @mission[mission][:status] = state
      # end
=end

# Run tests?
tests = false

# create a module named Environment 
module Environment
  # Depot
  class Depot
    # Packs available for the player
    attr_accessor :packs
    def initialize
      @packs = {
        simple_trasportation_pack: {
          inteligence: [:cellphone],
          items: [:medipack, :chevy_versa]
        },
        standard_trasportation_pack: {
          inteligence: [:cellphone, :antenna],
          arsenal: [:colt_1911],
          items: [:handcuffs, :medipack, :chemistry, :chevy_versa]
        },
        simple_mission_pack: {
          inteligence: [:infopack, :laptop, :cellphone, :antenna],
          arsenal: [:colt_1911],
          items: [:handcuffs, :medipack, :chemistry, :financial]
        },
        standard_mission_pack: {
          inteligence: [:infopack, :laptop, :cellphone, :antenna],
          arsenal: [:remington_870, :colt_1911, :machete, :hatchet],
          items: [:handcuffs, :medipack, :chemistry, :financial]
        }
      }
    end

  end


  # Control class
  class Control
    attr_accessor  :missions
    def initialize 
      @missions = Hash.new
      @states = [:paused, :aborted, :failed, :accomplished]
      generate_methods
    end

    # Starts a new mission
    def new_mission(name, objective, pack)
      @missions[name] = {objective: objective, pack: pack, status: :active}
    end

    # Metaprogramming section:
    # Dinamically generate methods corresponding to each mission state
    # Created on the fly by using 'define_method', and used by game.rb
    # Methods:
    #  set_mission_to_paused
    #  set_mission_to_aborted
    #  set_mission_to_failed
    
    def generate_methods
      @states.each do |state|
        self.class.define_method("set_mission_to_#{state}".to_sym) do |mission|
          @missions[mission][:status] = state
          puts "Mission #{mission} status changed to #{state} "
        end
      end
    end

  end


  # Human class
  class Human
    attr_accessor :id, :name, :personal_data, :professional_data
    def initialize
      @id = self.object_id            # Id of object when created
      @name                           # Name given by user when instantiated
      @personal_data = Hash.new       # Hash
      @professional_data              # kwargs 
    end

    # Metaprogramming section:
    # Dinamically generate methods corresponding to each mission state
    # Created on the fly by using 'define_method', and used by game.rb
    # Methods
    #   set_personal data
    #   set_professional_data
    # 
    
  end

  class Worker < Human
    attr_accessor :standard_shift, :extra_shift

    def initialize  
      @id = self.object_id
      @extra_shift = Hash.new
      @standard_shift = Hash.new
    end

    def set_worker_shifts
      @standard_shift = {
        id: @id,
        hours: 8,
        payment: 8,
        facility: String.new,
        status: nil
      }

      @extra_shift = {
        id: @id,
        hours: 0,
        payment: 0.0,
        facility: String.new,
        status: nil
      }
    end

  end

end

include Environment


# Depot tests
depot = Depot.new

if tests == true
    # Control tests
  puts '------------------'
  puts 'Control tests'
  puts '------------------'

  control = Control.new()
  name = :alpha
  objective = 'Get Alpha to the base'
  pack = :simple_trasportation_pack
  control.new_mission(name, objective, depot.packs[pack])
  puts control.missions[name]
  control.set_mission_to_paused(name)
  control.set_mission_to_aborted(name)
  control.set_mission_to_failed(name)
  control.set_mission_to_accomplished(name)
  
  
  # Human tests
  puts
  puts '------------------'
  puts 'Human class tests'
  puts '------------------'

  human = Human.new
  puts "Human class id: #{human.id}"
  puts
  
  # Worker tests
  puts
  puts '------------------'
  puts 'Worker class tests'
  puts '------------------'

  worker = Worker.new
  worker.set_worker_shifts
  
  puts worker.standard_shift
  puts worker.extra_shift
  puts "Hours class: #{worker.extra_shift[:payment].class}"
  puts "Payment class: #{worker.extra_shift[:payment].class}"
  # puts depot.packs[:simple_mission_pack]
  # puts control.missions['alpha']
  
end
