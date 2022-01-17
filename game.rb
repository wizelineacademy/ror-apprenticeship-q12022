require_relative 'environment'

class Game
  include Environment

  attr_accessor :board, :depot, :control

  def initialize
    @board = {
      players:{

      },
      control:{

      },
      status: nil
    } 
    @depot = Environment::Depot.new
    @control = Environment::Control.new
  end

  
end
