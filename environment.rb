module Environment
  class Depot
    attr_accessor :packs
    def initialize
      @packs = {
        simple_transportation_pack: {
          intelligence:[:cellphone],
          items: [:medipack, :chevy_versa]
        },
        standard_transportation_pack: {
          intelligence: [:cellphone, :antenna],
          arsenal: [:colt_1911],
          items: [:handcuffs, :medipack, :chemistry, :chevy_versa]
        },
        simple_mission_pack: {
          intelligence: [:infopack, :laptop, :cellphone, :antenna],
          arsenal: [:colt_1911],
          items: [:handcuffs, :medipack, :chemistry, :financial]
        },
        standard_mission_pack: {
          intelligence: [:infopack, :laptop, :cellphone, :antenna],
          arsenal: [:remington_870, :colt_1911, :machete, :hatchet],
          items: [:handcuffs, :medipack, :chemistry, :financial]
          }
        }
    end
  end

  class Control
    mission_status = %i[paused aborted failed accomplished]
    attr_accessor :missions
    def initialize
      @missions = {}
    end

    mission_status.each do |status|
      define_method("set_mission_to_#{status}") do |arg|
        @missions[arg][:status] = status
      end
    end
    def new_mission(name: nil, objective: nil, pack: nil)
      @missions[name.to_sym] =  {objective: objective, status: :active, pack: pack}
    end
  end

  class Human
    attr_accessor :id ,:name ,:personal_data, :professional_data
    def initialize name
      @id = self.object_id
      @name = name
    end
    data_types = %i[personal professional]
    data_types.each do |type|
      define_method("set_#{type}_data") do |arg|
        if type == :personal
          @personal_data ={surname: arg[:surname], age: arg[:age],
            country: arg[:country], language: arg[:language],
            marital_status: arg[:marital_status], children: arg[:children]
          }
        elsif type == :professional
          @proffesional_data={
            position: arg[:position], occupation: arg[:occupation],
            skills: arg[:skills], observations: arg[:observations]
          }
        end
      end
    end
  end

  class Worker < Human
    attr_accessor :standard_shift, :extra_shift
    def set_shift
      @standard_shift = {
        id: self.object_id,
        hours: 8,
        payment: 8,
        facility: String.new,
        status: nil
      }
      @extra_shift ={
        id: self.object_id,
        hours: 0,
        payment: 0.0,
        facility: String.new,
        status:nil
      }
    end
  end
end
