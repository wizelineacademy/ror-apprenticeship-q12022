module Environment
  class Depot
    attr_accessor :packs 
    
    def initialize
      @packs = {
        simple_transportation_pack: { 
          intelligence:[:cellphone],
          tems: [:medipack, :chevy_versa]
        },
        standard_transportation_pack: {
          intelligence: [:cellphone, :antena],
          arsenal: [:colt_1911],
          items: [:handcuffs, :medipack, :chemistry, :chevy_versa]
        },
        simple_mission_pack: {
          intelligence: [:infopack, :laptop, :cellphone, :antena],
          arsenal: [:colt_1911],
          items: [:handcuffs, :medipack,:chemistry,:finalcial]
        },
        standard_mission_pack: {
          intelligence: [:infopack, :laptop, :cellphone, :antena],
          arsenal: [:remington_870, :colt_1911, :machete, :hatchet],
          items: [:handcuffs, :medipack, :chemistry, :finalcial]
        } 
      }
     end

    end

  class Control
    attr_accessor :missions
    
    def initialize
      @missions = {}
    end
    
    status = %w(paused aborted failed accomplished)

    status.each do |s|
      define_method("set_mission_to_#{s}") do |args|
        @missions[args][:status] = s.to_sym
      end
    end
    
    def new_mission(name: , objective: , pack: )
      @missions[name] = {objective: objective, status: :active, pack: pack }
    end

  end
  
  class Human
    attr_accessor :id, :name, :personal_data, :professional_data

    types = %w(personal professional)

    types.each do |type|
      define_method("set_#{type}_data") do |args|
        instance_variable_set("@#{type}_data", args)
        p args
      end
    end
    
    def initialize(name: , personal_data: , professional_data: )
      id = sprintf("%20.10f", Time.now.to_f).delete('.').to_i.to_s(36)
      @id = id
      @name = name
      @personal_data = personal_data
      @professional_data = professional_data
    end
  end

  class Worker < Human
    attr_accessor :standard_shift, :extra_shift

    def initialize
      id = sprintf("%20.10f", Time.now.to_f).delete('.').to_i.to_s(36)
      
      @standard_shift = {
        id: id, 
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