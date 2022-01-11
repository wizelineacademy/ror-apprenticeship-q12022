module Environment

  class Depot
    attr_accessor :packs

    def initialize
      @packs = {
        simple_transportation_pack: {
          intelligence: %i[cellphone],
          items: %i[medipack chevy_versa]
        },
        standard_transportation_pack: {
          intelligence: %i[cellphone antenna],
          arsenal: [:colt_1911],
          items: %i[handcuffs medipack chemestry chevy_versa]
        },
        simple_mission_pack: {
          intelligence: %i[infopack laptop cellphone antenna],
          arsenal: [:colt_1911],
          items: %i[handcuffs medipack chemistry financial]
        },
        standard_mission_pack: {
          intelligence: %i[infopack laptop cellphone antenna],
          arsenal: %i[remington_870 colt_1911 machete hatchet],
          items: %i[handcuffs medipack chemistry financial]
        }}
    end
  end

  class Control
    attr_accessor :missions
    states = [:paused, :aborted, :failed, :accomplished]

    def initialize
      @missions = {}
    end

    def new_mission(name:, objective:, pack:)
      @missions[name] = {
        objective: objective,
        status: :active,
        pack: pack
      }
    end

    #metapograming
    states.each do |state|
      define_method("set_mission_to_#{state}") do |name|
        @missions[name][:status] = state
      end
    end
  end

  class Human
    attr_accessor :id, :name, :personal_data, :professional_data
    @@types = [:personal, :professional]

    def initialize(name:, personal_data:, professional_data:)
      @id = object_id
      @name = name
      @personal_data = personal_data
      @professional_data = professional_data
    end

    #metapograming
    @@types.each do |type|
      define_method("set_#{type}_data") do |args|
        instance_variable_set("@#{type}_data", args)
      end
    end
  end

  class Worker < Human
    attr_accessor :standard_shift, :extra_shift

    def initialize(name:, personal_data:, professional_data:)
      super(name: name, personal_data: personal_data, professional_data: professional_data)

      @standard_shift = {
        id: id,
        hours: 8,
        payment: 8,
        facility: String.new,
        status: nil
      }

      @extra_shift = {
        id: id,
        hours: 0,
        payment: 0.0,
        facility: String.new,
        status: nil
      }
    end
  end
end
