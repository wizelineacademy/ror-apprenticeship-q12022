require_relative 'environment.rb'

class ErrorTest
  include Environment
  attr_accessor :board, :depot, :control, :dictionary, :poker

  def initialize
    @board = { players: Hash.new, control: Hash.new, status: nil }
    @control = Environment::Control.new
    @depot = Environment::Depot.new
  end

  def new_worker name: nil
    begin
      @board[:players].store name, Environment::Worker.new(name)
    rescue NoMethodError
      puts 'No name for worker given'
    end
  end

  def new_mission (*args)
    begin
      @control.new_mission(name: name, objective: objective, pack: pack)
  		@board[:control][:missions] =  @control.missions
    rescue NameError
      puts 'Required Argument missing'
    end
  end

  def set_holiday(arg)
    begin
      arg[:worker].set_holiday_data arg
    rescue NoMethodError
      puts 'Method does not exist'
    end
  end
end
test = ErrorTest.new
test_worker = test.new_worker
#no name sent to arg
name = :alpha; objective = 'Get Alpha to the base'; pack = :simple_transportation_pack
test.new_mission  objective: objective, pack: test.depot.packs[pack]
#trying to acces a fake method
test.set_holiday({worker: test_worker,surname: 'Mota', "age": 40, marital_status: :single,
   children: 0, country: :mx, language: :es })

