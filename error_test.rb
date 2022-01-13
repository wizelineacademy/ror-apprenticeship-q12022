require_relative './environment.rb'

class ErrorTest
	include Environment 
	attr_accessor :board, :depot, :control 
  
	def initialize
		@board = { 
			players: {},
			control: {},
			status: nil 
		}
		@depot = Environment::Depot.new
    	@control = Environment::Control.new
	end
	
	def new_worker name: nil
		begin
      raise NameError, 'Name cannot be empty' if name.nil?
		
			@board[:players].store name, Environment::Human::Worker.new(name)
		rescue NameError => e
			puts "Error: #{e}"
		end
	end

	

	def new_mission name: nil, objective: nil, pack: nil
		begin
      raise NameError, 'name cannot be empty'     if name.nil?
			raise NameError, 'Objetive cannot be empty' if objective.nil?
			raise NameError, 'Pack cannot be empty'     if pack.nil?
			
			@control.new_mission(name: name, objective: objective, pack: pack)
			@board[:control][:missions] = @control.missions
		rescue NameError => e
		puts "Error: #{e}"
	end
	end
end

error_test = ErrorTest.new
player = error_test.new_worker

player2 = error_test.new_mission name: "Fer", objective: "Conquer the zone"

# player1 = error_test.new_worker name: 'Diego'
# diego.set_personal_data(surname: 'Mota', age: 40, marital_status: :single, children: 0, country: :mx, language: :es)
# diego.set_professional_data(position: 'SE', occupation: 'IT', skills: [:ruby, :blender], observations: 'none')
# puts "#{diego.name}, #{diego.class}", diego.personal_data, diego.professional_data

# name = :alpha; objective = 'Get Alpha to the base'; pack = :simple_transportation_pack
# error_test.new_mission(name: name, objective: objective, pack: error_test.depot.packs[pack])
# puts error_test.control.missions[:alpha]
# error_test.control.set_mission_to_accomplished(:alpha) and puts error_test.control.missions[:alpha]