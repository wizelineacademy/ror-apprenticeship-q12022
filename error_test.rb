require_relative 'environment.rb'

class ErrorTest
  include Environment
  attr_accessor :board, :depot, :control, :dictionary, :poker

  def initialize
    @board = { players: Hash.new, control: Hash.new, status: nil }
    @control = Environment::Control.new
  end

  def new_worker name: nil
    begin
      @board[:players].store name, Environment::Worker.new(name)
    rescue NoMethodError
      puts 'No name for worker given'
    end
  end
end