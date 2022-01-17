# frozen_string_literal: true

require_relative 'environment'

class ErrorTest
  include Environment
  attr_accessor :board, :depot, :control

  def initialize
    @board = { players: {}, control: {}, status: nil }
    @control = Environment::Control.new
    @depot = Environment::Depot.new
  end

  def error_logger(e)
    File.open("error_logger.txt", "a") do |file|
      file.puts e
    end
  end

  def new_worker(name: nil)
    @board[:payers[name]] = Environment::Worker.new(name: name, personal_data: nil, professional_data: nil)
  rescue StandardError => e
    error_logger("Error : #{e}. Error catched at #{Time.now}")
  end

  def new_mission(name:, objective:, pack:)
    if name.nil? || name.empty? || objective.nil? || objective.empty? || pack.nil? || pack.empty?
      raise StandardError, 'you can not have empty or nil fields'
    end
    @control.new_mission(name: name, objective: objective, pack: pack)
  rescue StandardError => e
    error_logger("Error : #{e}. Error catched at #{Time.now}")
  end

  def get_missions(name: nil)
    if name.nil? || name.empty?
      raise StandardError, 'you can not have empty or nil fields'
    end
    control.missions[name]
  rescue StandardError => e
    error_logger("Error : #{e}. Error catched at #{Time.now}")
  end
end

test_e = ErrorTest.new
test_e.new_worker
name = ''
objective = 'Get Alpha to the base'
pack = :simple_transportation_pack
test_e.new_mission name: name, objective: objective, pack: test_e.depot.packs[pack]
test_e.get_missions name: name
