require_relative 'enviroment'
class Game
  attr_accessor :depot, :control, :board

  include Enviroment

  def initialize
    @depot = Enviroment::Depot.new
    @control = Enviroment::Control.new
    @board = {
      players: {},
      control: {},
      status: nil
    }
  end

  def new_worker(name:)
    worker = Enviroment::Worker.new(name: name)
    board[:players].store(name, worker)
  end

  def new_mission(name:, objective:, pack:)
    control.new_mission(name: name, objective: objective, pack: pack)
  end
end

