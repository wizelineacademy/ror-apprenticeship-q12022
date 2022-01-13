require_relative 'environment'

class ErrorTest
  include Environment
  attr_accessor :depot, :control, :board

  def initialize
    @board = {
      players: {},
      control: {},
      status: nil
    }
    @control = Environment::Control.new
  end

  def new_worker(name: nil)
    begin
      raise TypeError, "parameter cannot be #{name.class}, name => string" unless name.is_a? String

      @board[:players].store name, Environment::Worker.new(name: name)
    rescue TypeError => e
      puts e
    end
  end

  def new_mission(name: nil, objective: nil, pack: nil)
    begin
      collect = []
      [name, objective, pack].each { |val| collect << val if val.is_a? NilClass }
      raise TypeError, "Missing parameter(s), check for #{collect.length} of them" unless collect.empty?

      @control.new_mission name: name, objective: objective, pack: pack
      @board[:control][:missions] = @control.missions
    rescue TypeError => e
      puts e
  end
end

x = ErrorTest.new
x.new_worker name: 'damian'
x.new_mission(pack: {})
