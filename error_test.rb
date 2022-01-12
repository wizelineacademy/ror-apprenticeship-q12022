require './environment.rb'

class ErrorTest
	include Environment 
	attr_accessor :board, :depot, :control 
  
	def initialize
		@board = { 
			players: {},
			control: {},
			status: nil }
		@depot = Environment::Depot.new
    @control = Environment::Control.new
	end
	
	# def new_worker name: nil
  #   begin
  #     @board[:players].store name, Environment::Worker.new(name)
  #   rescue NoMethodError
  #     puts 'No name for worker given'
  #   end
  # end

	def new_mission name:nil, objetive: nil, pack: nil
		begin

		rescue
	end

	

end