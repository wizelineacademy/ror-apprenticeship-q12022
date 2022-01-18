# frozen_string_literal: true

module Enviroment
  # Class Depot
  # XoCe: Tuve que separar las definiciones de los sub hashes porque Rubocop se quejaba :(
  # no me cae bien, ese poli es mas quejumbroso que Chandler Bing =_=
  class Depot
    attr_accessor :packs

    def initialize
      @packs = {
        simple_transportation_pack: simple_trasportation_pack,
        standard_transportation_pack: standard_transportation_pack,
        simple_mission_pack: simple_mission_pack,
        standard_mission_pack: standard_mission_pack,
        default: 'not asigned'
      }
    end

    def simple_trasportation_pack
      { intelligence: [:cellphone], items: %i[medipack chevy_versa] }
    end

    def standard_mission_pack
      { intelligence: %i[infopack laptop cellphone antenna],
        arsenal: %i[remington870 colt1911 machete hatchet], items: %i[handcuffs medipack chemistry financial] }
    end

    def standard_transportation_pack
      { intelligence: %i[cellphone antenna],
        arsenal: [:colt1911], items: %i[handcuffs medipack chemistry chevy_versa] }
    end

    def simple_mission_pack
      { intelligence: %i[infopack laptop cellphone antenna], arsenal: [:colt1911],
        items: %i[handcuffs medipack chemistry financial] }
    end
  end

  # Class Control
  class Control
    attr_accessor :missions

    MISSION_STATES = %w[pause abort failed accomplished].freeze

    def initialize
      @missions = {}
    end

    def new_mission(**kwargs)
      @missions[kwargs[:name]] = {
        objective: kwargs[:objective],
        status: :active,
        pack: kwargs[:pack]
      }
    end

    # Metaprograming section: generate methods corresponding to each mission state
    # The method names will be:
    #  - set_mission_to_paused
    #  - set_mission_to_aborted
    #  - set_mission_to_failed
    #  - set_mission_to_accomplished
    MISSION_STATES.each do |state|
      define_method("set_mission_to_#{state}") do |name|
        p "Status has changed to #{state}"
        @missions[name.to_sym][:status] = state.to_sym
      end
    end
  end

  # Class Human
  class Human
    attr_accessor :id, :name

    HUMAN_DATA_TYPES = %w[personal professional].freeze

    def initialize(**kwargs)
      @id = object_id
      @name = kwargs[:name]
      set_data_methods
    end

    def set_data_methods
      HUMAN_DATA_TYPES.each do |type|
        self.class.send(:attr_accessor, "#{type}_data".to_sym)
        self.class.define_method("set_#{type}_data".to_sym) do |data|
          instance_variable_set("@#{type}_data", data)
          puts "The #{type} data was updated"
        end
      end
    end
  end

  # Class Worker inherited from Human
  class Worker < Human
    attr_accessor :standar_shift, :extra_shift

    def initialize(**kwargs)
      super
      @standar_shift = { id: object_id, hours: 8, payment: 8, facility: nil, status: nil }
      @extra_shift = { id: object_id, hours: 0, payment: 0.0, facility: nil, status: nil }
    end
  end
end

p 'Testing file'
Enviroment::Human.new(name: 'diego')
