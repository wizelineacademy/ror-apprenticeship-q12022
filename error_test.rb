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
  end

  def new_worker(name: nil)
    begin
      @board[:players][name.to_sym] = Environment::Worker.new(name: name)
      p @board
    rescue NoMethodError
      puts "No name for worker given"
    end
  end
end

errorEnv = ErrorTest.new
newWorker = errorEnv.new_worker
