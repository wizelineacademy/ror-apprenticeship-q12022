module Environment
    class Depot
        attr_accessor :packs

        def initialize
            @packs = {
                :simple_transportation_pack => [
                    :intelligence => [:cellphone],
                    :items => [:medipack, :chevy_versa]
                ],
                :standard_transportation_pack => [
                    :intelligence => [:cellphone, :antenna],
                    :arsenal => [:colt_1911],
                    :items => [:handcuffs, :mediapack, :chemistry, :chevy_versa]
                ],
                :simple_mission_pack => [
                    :intelligence => [:infopack, :laptop, :cellphone, :antenna],
                    :arsenal => [[:colt_1911],[:handcuffs, :mediapack, :chemistry, :financial]],
                ],
                :standard_mission_pack => [
                    :intelligence => [:infopack, :laptop, :cellphone, :antenna],
                    :arsenal => [:remington_870, :colt_1911, :machete, :hatchet],
                    :items => [:handcuffs, :mediapack, :chemistry, :financial]
                ]
            }
        end

    end

    class Control
        attr_accessor :missions
        @@states = [:paused, :aborted, :accomplished, :failed]

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

        @@states.each do |state|
            define_method("set_mission_to_#{state}") do |mission|
                @missions[mission][:status] = state
            end
        end
    end

    class Human
        attr_accessor :id, :name, :personal_data, :professional_data 

        def initialize(name:)
            @id = rand(0...3000)
            @name = name
            @personal_data = {}
            @professional_data = {}
        end

        ["personal", "professional"].each do |data|
            define_method("set_#{data}_data") do |arg|
                data_type = "@#{data}_data"
                instance_variable_set(data_type, arg)
            end
        end
        
    end

    class Worker < Human
        attr_accessor :standard_shift, :extra_shift

        def initialize(name:)
            super(name: name)
            @standard_shift = {
                id: rand(0..3000),
                hours: 8,
                payment: 8,
                facility: '',
                status: nil
            }
            @extra_shift = {
                id: rand(0..3000),
                hours: 0,
                payment: 0.0,
                facility: '',
                status: nil
            }
        end
    end
end