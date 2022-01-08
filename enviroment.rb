module Enviroment
  class Depot
    attr_accessor :packs

    def initialize
      @packs = {
        simple_transportation_pack: { intelligence: [:cellphone], items: %i[medipack chevy_versa] },
        standard_transportation_pack: { intelligence: %i[cellphone antenna], arsenal: [:colt_1911],
                                        items: %i[handcuffs medipack chemestry chevy_versa] },
        simple_mission_pack: { intelligence: %i[infopack laptop cellphone antenna], arsenal: [:colt_1911],
                               items: %i[handcuffs medipack chemistry financial] },
        standard_mission_pack: { intelligence: %i[infopack laptop cellphone antenna], arsenal: %i[remington_870 colt_1911 machete hatchet],
                                 items: %i[handcuffs medipack chemistry financial] }
      }
    end
  end

  class Control
    attr_accessor :missions

    states = %i[paused aborted accomplished failed]

    states.each do |state|
      define_method("set_mission_to_#{state}") do |mission_name|
        missions[mission_name][:status] = state
      end
    end

    def initialize
      @missions = {}
    end

    def new_mission(name:, objective:, pack:)
      missions[name] = { objective: objective, status: :active, pack: pack }
    end
  end

  class Human
  end
end
