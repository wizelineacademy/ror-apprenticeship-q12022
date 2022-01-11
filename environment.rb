require 'securerandom' #Gem to generate ids

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
      attr_accessor :missions

      states = %i[paused aborted accomplished failed]

      states.each do |state|
        define_method("set_mission_to_#{state}") do |mission|
          @missions[mission][:status] = state
        end
      end

      def initialize
        @missions = {}
      end
      
      def new_mission :name, :objective, :pack
          @missions[name] = {objective: objective, status: :active, pack: pack}
      end
  end

  class Human
    attr_accessor :id, :name, :personal_data, :professional_data

    data_types = %i[personal professional]

    data_types.each do |data_type|
      define_method("set_#{data_type}_data") do |args|
        instance_variable_set("@#{data_type}_data", args)
      end
    end

    def initialize :name, :personal_data, :professional_data
      @id = SecureRandom.uuid
      @name = name
      @personal_data = personal_data
      @professional_data = professional_data
    end
  end

  class Worker < Human
    attr_accessor :standard_shift, :extra_shift

    def initialize :id :name, :personal_data, :professional_data
      super(
        id: id,
        name: name,
        personal_data: personal_data,
        professional_data: professional_data
      )

      @standard_shift = {
        id: @id, 
        hours: 8,
        payment: 8, 
        facility: String.new,
        status: nil
      }

      @extra_shift = {
        id: @id, 
        hours: Integer.new,
        payment: Float.new, 
        facility: String.new, 
        status: nil
      }
    end
  end
end