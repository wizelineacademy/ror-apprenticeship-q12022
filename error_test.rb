# frozen_string_literal: true

require_relative 'environment'

class ErrorTest
  include Environment
  attr_accessor :board, :depot, :control, :dictionary, :poker

  def initialize
    @board = { players: {}, control: {}, status: nil }
    @control = Environment::Control.new
  end

  def new_worker(name: nil)
    begin
      @board[:players].store name, Environment::Worker.new(name)
    rescue ArgumentError
      puts 'No name for worker given'
  end

  def new_mission(**args)
    begin
      @control.new_mission(**args)
      @board[:control] = {
        missions: @control.missions
      }
    rescue ArgumentError
      puts 'Incomplete params for mission given'
    rescue StandardError => e
      puts "Error occurred: #{e}"
    end
  end

  def set_mission_to_aborted(mission: nil)
    begin
      @control.set_mission_to_aborted(mission)
    rescue StandardError => e
      puts "Error occurred: #{e}"
    end
  end
end

# Testing errors

test = ErrorTest.new
test.new_worker
test.new_mission(name: :alpha, objective: 'skds', pack: "sdjsk")
