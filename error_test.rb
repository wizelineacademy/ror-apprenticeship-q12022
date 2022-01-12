require_relative 'environment.rb'

class ErrorTest
  include Environment
  attr_accessor :board, :depot, :control, :dictionary, :poker

  def initialize
    @board = { players: {}, control: {}, status: nil }
    @control = Environment::Control.new
    @depot = Environment::Depot.new
  end

  def new_worker(name: nil)
    begin
      @board[:players].store name, Environment::Worker.new(name)
    rescue 
      puts 'No name for worker given'
    end
  end

  def new_mission(name:nil, objective:nil, pack:nil)
    begin
      @missions[name] = {objective: objective, status: :active, pack: pack}
    rescue
      puts 'All arguments are required'
    end
  end

  def set_personal_data(**args)
    begin
      player = @board[:players].select{|player| player.name == name}
      raise Exception.new "Missing player" if player.empty?
      player.set_personal_data(**args)
    rescue Exception => e
      puts "Exception : #{e}"
    rescue
      puts "Something went wrong"
    end
  end

end

#TEST
errors = ErrorTest.new
errors.new_worker
errors.new_mission
errors.set_personal_data(name: 'Diego', surname: 'Mota', age: 40, marital_status: :single)
