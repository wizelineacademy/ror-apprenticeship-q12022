module Enviroment
  class Depot
    attr_accessor :packs

    def initialize
      @packs = {}
      @packs[:simple_transportation_pack] = { intelligence: [:cellphone], items: %i[medipack chevy_versa] }
      @packs[:standard_transportation_pack] =
        { intelligence: %i[cellphone antenna], arsenal: [:colt_1911],
          items: %i[handcuffs medipack chemestry chevy_versa] }
      @packs[:simple_mission_pack] =
        { intelligence: %i[infopack laptop cellphone antenna], arsenal: [:colt_1911],
          items: %i[handcuffs medipack chemistry financial] }
      @packs[:standard_mission_pack] =
        { intelligence: %i[infopack laptop cellphone antenna], arsenal: %i[remington_870 colt_1911 machete hatchet],
          items: %i[handcuffs medipack chemistry financial] }
    end
  end

  class Control
    attr_accessor :missions

    def initialize
      @missions
    end

    def new_mission(name:, objective:, pack:); end
  end

  class Human
  end
end
