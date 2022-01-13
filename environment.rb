module Environment
	class Depot
		attr_accessor :packs
		def initialize
			@packs = {
				simple_transportation_pack: {
					intelligence: [:cellphone],
					items: [:medipack, :chevy_versa]						
				},		
				standard_transportation_pack: {
					intelligence: [:cellphone, :antenna],
					arsenal: [:colt_1911],
					items: [:handcuffs, :medipack, :chemistry, :chevy_versa]
				},
				  simple_mission_pack: {
					intelligence: [:infopack, :laptop, :cellphone, :antenna],
					arsenal: [[:colt_1911], [:handcuffs, :medipack, :chemistry, :financial]]
				},
				standar_mission_pack: {
					intelligence: [:infopack, :laptop, :cellphone, :antenna],
					arsenal: [:remington_870, :colt_1911, :machete, :hatchet],
					items: [:handcuffs, :medipack, :chemistry, :financial]
				}
			}
		end
    end

    class Control
		attr_accessor :missions
		@@modes = [:paused, :aborted, :accomplished, :failed]
		def initialize
			@missions = {}
		end

		def new_mission name:, objective:, pack:
			@missions[name] = {
				objective: objective,
				status: :active,
				pack: pack
			}
		end
		
		@@modes.each do |mode|
			define_method("set_mission_to_#{mode}") do |mission|
				@missions[mission][:status] = mode
			end
		end
    end


	class Human
		attr_accessor :id, :name, :personal_data, :professional_data

		def initialize name: nil
			@name = name
			@id = object_id
		end

		define_method("set_personal_data") do |surname:, age:, country:, language:, marital_status:, children:|
			@personal_data = {
				surname: surname,
				age: age,
				country: country,
				language: language,
				marital_status: marital_status,
				children: children
			}
		end

		define_method("set_professional_data") do |position:, occupation:, skills: , observations: |
			@professional_data = {
				position: position,
				occupation: occupation, 
				skills: skills,
				observations: observations
			}
		end
	
		class Worker < Human
			attr_accessor :standard_shift, :extra_shift

			def initialize name
				super name: name
				@standard_shift = {
					id: @id,
					hours: 8,
					payment: 0.0,
					facility: "", #(or nil)
					status: nil #(will be of type )
				}
				@extra_shift = {
					id: @id, #Id of the object when created.
					hours: 8,
					payment:0.0,
					facility: "", #(or nil)
					status: nil #(will be of type Symbol)
				}
			end
		end
	end
end