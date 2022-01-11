module Environment
  class Depot
    attr_accessor :packs

    def initialize
      @packs = {
        simple_transportation_pack: {
          :intelligence => [:cellphone],
          :items => [:medipack, :chevy_versa]
        },
        standard_transportation_pack: {
          :intelligence => [:cellphone, :antenna],
          :arsenal => [:colt_1911],
          :items => [:handcuffs, :medipack, :chemistry, :chevy_versa]
        },
        simple_mission_pack: {
          :intelligence => [:infopack, :laptop, :cellphone, :antenna],
          :arsenal=> [:colt_1911],
          :items => [:handcuffs, :medipack, :chemistry, :financial]
        },
        standard_mission_pack:{
          :intelligence => [:infopack, :laptop, :cellphone, :antenna],
          :arsenal => [:remington_870, :colt_1911, :machete, :hatchet],
          :items => [:handcuffs, :medipack, :chemistry, :financial]
        }
      }
    end
  end
  
  class Control
    attr_accessor :missions

    def initialize
      @missions = {}
    end
    
    def new_mission(name: name, objective: objective, pack: pack)
      @missions[name] = { 
        objective: objective, 
        pack: pack, 
        status: :active 
      }
    end

    statuses = %w(paused aborted failed accomplished)
    statuses.each do |status|
      define_method("set_mission_to_#{status}") do |arg|
        @missions[arg][:status] = status.to_sym
      end
    end
  end
  
  class Human
    attr_accessor :id, :name, :personal_data, :professional_data

    def initialize(name)
      @id = object_id
      @name = name
    end

    data = %w(personal_data professional_data)
    data.each do |type|
      define_method("set_#{type}") do |arg|
        instance_variable_set("@#{type}", arg)
      end
    end  
  end

  class Worker < Human
    attr_accessor :standard_shift, :extra_shift
    
    def initialize(name)
      super
      @standard_shift = { 
        :id => @id,
        :hours => 8,
        :payment => 8,
        :facility => String.new,
        :status => nil
      }
      @extra_shift = { 
        :id => id,
        :hours => Integer,
        :payment => Float,
        :facility => String.new,
        :status => nil
      }
    end
  end 
end
