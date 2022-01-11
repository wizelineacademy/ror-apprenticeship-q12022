module Environment
  class Depot
    attr_accessor :packs

    def initialize
      @packs = {
        simple_transportation_pack: {
          intelligence: [:cellphone],
          item: [
            :medipack,
            :chevy_versa
          ]
        },
        standard_transportation_pack: {
          intelligence: [
            :cellphone,
            :antenna
          ],
          arsenal: [
            :colt_1911
          ],
          items: [
            :handcuffs,
            :medipack,
            :chemistry,
            :chevy_versa
          ]
        },
        simple_mission_pack: {
          intelligence: [
            :infopack,
            :laptop,
            :cellphone,
            :antenna
          ],
          arsenal: [:colt_1911, :handcuffs, :medipack, :chemistry, :financial]
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
    attr_accessor :missions

    @@mission_status = %w(active paused aborted accomplished failed)

    @@mission_status.each do |status|
      define_method("set_mission_to_#{status}") { |mission| @missions[mission][:active] = status }
    end

    def initialize
      @missions = {}
    end

    def new_mission(name, objective, pack)
      @missions[name] = { objective: objective, pack: pack, active: @@mission_status.first }
    end
  end

  class Human
    attr_accessor :id, :name, :personal_data, :professional_data

    def initialize(name, personal_data, professional_data)
      @id = object_id
      @name = name
      @personal_data = personal_data
      @professional_data = professional_data
    end

    %w[professional personal].each do |data_type|
      define_method("set_#{data_type}_data") { |args| instance_variable_set("@#{data_type}_data", args) }
    end
  end

  class Worker < Human
    attr_accessor standard_shift, extra_shift

    def initialize()
      @standard_shift = {
        id: object_id,
        hours: 8,
        payment: 8,
        facility: String.new,
        status: nil
      }

      @extra_shift = {
        id: object_id,
        hours: Integer.new,
        payment: Float.new,
        facility: String.new,
        status: nil
      }
    end
  end
end