require_relative 'enviroment'
class Game
  attr_accessor :depot, :control

  include Enviroment

  def initialize
    @depot = Enviroment::Depot.new
    @control = Enviroment::Control.new
    @human = Enviroment::Human
    @worker = Enviroment::Worker
  end
end