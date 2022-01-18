# frozen_string_literal: true

module Environment
  # Class to declare depot
  class Depot
    attr_accessor :packs

    def initialize
      @packs = {
        simple_transportation_pack: [intelligence: %i[cellphone], items: %i[medipack chevy_versa]],
        standard_transportation_pack: [intelligence: %i[cellphone antenna], arsenal: %i[colt1911],
                                       items: %i[handcuffs mediapack chemistry chevy_versa]],
        simple_mission_pack: [intelligence: %i[infopack laptop cellphone antenna],
                              arsenal: %i[[colt1911] [handcuffs mediapack chemistry financial]]],
        standard_mission_pack: [intelligence: %i[infopack laptop cellphone antenna],
                                arsenal: %i[remington870 colt1911 machete hatchet],
                                items: %i[handcuffs mediapack chemistry financial]]
      }
    end
  end

  # Class to define game controls
  class Control
    attr_accessor :missions

    @states = %i[paused aborted accomplished failed]

    def initialize
      @missions = {}
    end

    def new_mission(name:, objective:, pack:)
      @missions[name] = {
        objective: objective,
        pack: pack,
        status: :active
      }
    end

    @states.each do |state|
      define_method("set_mission_to_#{state}") do |mission|
        @missions[mission][:status] = state
      end
    end
  end

  # Class to define human entity
  class Human
    attr_accessor :id, :name, :personal_data, :professional_data 

    def initialize(name)
      @id = rand(0...3000)
      @name = name
      @personal_data = {}
      @professional_data = {}
    end

    %w[personal professional].each do |data|
      define_method("set_#{data}_data") do |arg|
        data_type = "@#{data}_data"
        instance_variable_set(data_type, arg)
      end
    end
  end

  # Class to define worker from human class
  class Worker < Human
    attr_accessor :standard_shift, :extra_shift

    def initialize_shifts 
      @standard_shift = { id: rand(0..3000), hours: 8, payment: 8, facility: '', status: nil }
      @extra_shift = { id: rand(0..3000), hours: 0, payment: 0.0, facility: '', status: nil }
    end
  end
end
