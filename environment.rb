module Enviroment
  class Depot
      attr_accessor :packs

      def initialize
        @packs = {
          simple_transportation_pack: { 
              intelligence: %i[:cellphone],
              items: %i[medipack chevy_versa] 
          },
          standard_transportation_pack: { 
              intelligence: %i[cellphone antenna], 
              arsenal: %i[:colt_1911],
              items: %i[handcuffs medipack chemestry chevy_versa] 
          },
          simple_mission_pack: { 
              intelligence: %i[infopack laptop cellphone antenna], 
              arsenal: %i[:colt_1911],
              items: %i[handcuffs medipack chemistry financial] 
          },
          standard_mission_pack: { 
              intelligence: %i[infopack laptop cellphone antenna], 
              arsenal: %i[remington_870 colt_1911 machete hatchet],
              items: %i[handcuffs medipack chemistry financial] 
          }
        }
      end
  end

  class Control
  end

  class Human
  end
end