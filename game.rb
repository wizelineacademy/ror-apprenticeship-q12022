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

  def new_worker(name)
    worker = Enviroment::Worker.new(name: name)
    board[:players].store(name, worker)
  end
end

g = Game.new
g.new_worker 'test'
g.new_worker 'another test'
p g.board[:players]['test']
