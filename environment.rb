# frozen_string_literal: true

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
        simple_trasportation_pack: simple_trasportation_pack,
        standard_trasportation_pack: standard_trasportation_pack,
        simple_mission_pack: simple_mission_pack,
        standard_mission_pack: standard_mission_pack
      }
    end

    def simple_trasportation_pack
      {
        inteligence: %i[cellphone],
        items: %i[medipack chevy_versa]
      }
    end

    def standard_trasportation_pack
      {
        inteligence: %i[cellphone antenna],
        arsenal: %i[colt_1911],
        items: %i[handcuffs medipack chemistry chevy_versa]
      }
    end

    def simple_mission_pack
      {
        inteligence: %i[infopack laptop cellphone antenna],
        arsenal: %i[colt_1911],
        items: %i[handcuffs medipack chemistry financial]
      }
    end

    def standard_mission_pack
      {
        inteligence: %i[infopack laptop cellphone antenna],
        arsenal: %i[remington_870 colt_1911 machete hatchet],
        items: %i[handcuffs medipack chemistry financial]
      }
    end
  end

  # Control class
  class Control
    attr_accessor :missions

    def initialize
      @missions = {}
      @states = %i[paused aborted failed accomplished]
      generate_methods
    end

    # Starts a new mission
    def new_mission(name, objective, pack)
      @missions[name] = { objective: objective, pack: pack, status: :active }
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
          puts "Mission '#{mission}' status changed to #{state} "
        end
      end
    end
  end

  # Human class
  class Human
    attr_accessor :id, :name

    def initialize(name)
      @id = object_id                 # Id of object when created
      @name = name == nil ? raise( ArgumentError ) : name  # Name given by user when instantiated
      @data_types = %i[personal_data professional_data]
      generate_methods
    end

    # Metaprogramming section:
    # Dinamically generate methods corresponding to each mission state
    # Created on the fly by using 'define_method', and used by game.rb
    # Methods
    #   set_personal data
    #   set_professional_data

    def generate_methods
      @data_types.each do |data|
        self.class.send(:attr_accessor, data.to_sym)
        self.class.define_method("set_#{data}".to_sym) do |data_input|
          instance_variable_set("@#{data}", data_input)
          puts "#{data} updated"
        end
      end
    end
  end

  # Class Worker
  class Worker < Human
    attr_accessor :standard_shift, :extra_shift

    def initialize(name)
      super
      @extra_shift = {}
      @standard_shift = {}
    end

    def standard_shift_data
      {
        id: @id,
        hours: 8,
        payment: 8,
        facility: String.new,
        status: nil
      }
    end

    def extra_shift_data
      {
        id: @id,
        hours: 0,
        payment: 0.0,
        facility: String.new,
        status: nil
      }
    end

    def set_worker_shifts
      @standard_shift = standard_shift_data
      @extra_shift = extra_shift_data
    end
  end
end

include Environment

if tests == true
  # Depot tests
  puts '------------------'
  puts 'Depot tests'
  puts '------------------'
  depot = Depot.new

  # Control tests
  puts '------------------'
  puts 'Control tests'
  puts '------------------'

  control = Control.new
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

  diego = Worker.new('Diego')
  # worker.set_worker_shifts

  personal_data =
    {
      surname: 'Mota',
      age: 40,
      country: :mx,
      language: :es,
      marital_status: :single,
      children: 0
    }

  professional_data =
    {
      position: 'SE',
      occupation: 'IT',
      skills: %i[ruby blender],
      observations: 'none'
    }

  diego.set_personal_data(personal_data)
  diego.set_professional_data(professional_data)

  puts "#{diego.name}, #{diego.class}", diego.personal_data, diego.professional_data

  # puts worker.standard_shift
  # puts worker.extra_shift
  # puts "Hours class: #{worker.extra_shift[:payment].class}"
  # puts "Payment class: #{worker.extra_shift[:payment].class}"
  # worker.extra_shift[:hours] = 2
  # puts worker.extra_shift

  # puts depot.packs[:simple_mission_pack]
  # puts control.missions['alpha']

end
