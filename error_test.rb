require_relative "environment.rb"

class ErrorTest
  include Environment
  attr_accessor :board, :depot, :control, :dictionary, :poker

  def initialize
    @board = {
      players: {},
      control: {},
      status: nil
    }
    @control = Environment::Control.new
    @depot = Environment::Depot.new
  end

  def new_worker(name: nil)
    begin
      @board[:players][name] = Environment::Worker.new(name: name)
    rescue ArgumentError => e
      puts "#{$!.class}: #{$!.message}"
    end
  end

  def new_worker_flexible(name: nil, personal_data: nil, professional_data: nil)
    begin
      @board[:players][name] = Environment::Worker.new(name: name, personal_data: personal_data, professional_data: professional_data)
    rescue ArgumentError => e
      p "#{$!.class}: #{$!.message}"
    ensure
      p "Ensure block at new_worker_flexible"
      @board[:players]["No name given"] = Environment::Worker.new(name: "No name given", personal_data: personal_data, professional_data: professional_data) if (name.nil? && !personal_data.nil? && !professional_data.nil?)
      @board[:players][name] = Environment::Worker.new(name: "No name given", personal_data: "No personal data given", professional_data: professional_data) if (!name.nil? && personal_data.nil? && !professional_data.nil?)
      @board[:players][name] = Environment::Worker.new(name: "No name given", personal_data: personal_data, professional_data: "No professional data given") if (!name.nil? && !personal_data.nil? && professional_data.nil?)
      puts "No info given" if (!name.nil? && !personal_data.nil? && !professional_data.nil?)
    end
  end

  def new_mission(name: nil, objective: nil, pack: nil)
    new_name =  name
    new_objective = objective
    unless !name.nil? && !objective.nil?
      begin
        raise StandardError, "Invalid inputs"
      rescue StandardError => e
        p "#{$!.class}: #{$!.message}"
        new_name = "No name given" if name.nil?
        new_objective = "No objective given" if objective.nil?
      end
    end
    @control.new_mission(name: new_name, objective: new_objective, pack: get_pack(pack: pack))
  end

  def get_pack(pack: nil)
    unless !pack.nil?
      begin
        raise KeyError, "Invalid inputs"
      rescue KeyError => e
        p "#{$!.class}: #{$!.message}"
        return @depot.packs[:standard_mission_pack]
      end
    end
    return @depot.packs[pack.to_sym]
  end

end

#errorEnv = ErrorTest.new
#newWorker2 = errorEnv.new_worker
#newWorker = errorEnv.new_worker_flexible(name: "Hector", professional_data: "He likes to work")
#errorEnv.new_mission(name: nil, objective: nil, pack: nil)
