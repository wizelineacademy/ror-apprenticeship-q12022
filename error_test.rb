require_relative 'environment'

class ErrorTest
   include Environment
   attr_accessor :board, :depot, :control 

  def initialize
    @board = { payers: {}, control: {}, status: nil}
    @depot = Environment::Depot.new
    @control = Environment::Control.new
  end

  def new_worker(name: nil)
    begin
      @board[:payers[name]] =  Environment::Worker.new(name:name, personal_data: nil,  professional_data: nil);
    rescue TypeError => e
     p  "TypeError : #{e} - Details: #{e.backtrace.join(' ')}"
    rescue StandardError => e
      p "StandardError : #{e} - Details: #{e.backtrace.join(' ')}"
    end
  end

  def new_mission(name:, objective: , pack: )
    begin
      raise StandardError.new "name cannot be nil or empty" if name.nil? || name.empty?
      raise StandardError.new "c cannot be nil" if objective.nil?
      raise StandardError.new "pack cannot be nil" if pack.nil?
    
      @control.new_mission(name:name, objective:objective, pack:pack)
    rescue StandardError => e
      p "StandardError : #{e} - Details: #{e.backtrace.join(' ')}"
    end
  end

  def get_missions(name: nil)
    begin
      raise KeyError.new  "name cannot be nil or empty" if name.nil? or name.empty?
      control.missions[name]
    rescue KeyError => e
      p "KeyError : #{e} - Details: #{e.backtrace.join(' ')}"
    rescue StandardError => e
      p "StandardError : #{e} - Details: #{e.backtrace.join(' ')}"
    end
  end
end

error_test = ErrorTest.new 
error_test.new_worker 
name = ''; objective = 'Get Alpha to the base'; pack = :simple_transportation_pack
error_test.new_mission name: name, objective: objective, pack: error_test.depot.packs[pack]
error_test.get_missions name:name