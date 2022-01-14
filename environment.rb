# create a module named Environment 

# Depot
class Depot
  # Packs available for the player
  attr_accessor :packs
  def initialize
    @packs = {
      simple_trasportation_pack: {
        inteligence: [:cellphone],
        items: [:medipack, :chevy_versa]
      },
      standard_trasportation_pack: {
        inteligence: [:cellphone, :antenna],
        arsenal: [:colt_1911],
        items: [:handcuffs, :medipack, :chemistry, :chevy_versa]
      },
      simple_mission_pack: {
        inteligence: [:infopack, :laptop, :cellphone, :antenna],
        arsenal: [:colt_1911],
        items: [:handcuffs, :medipack, :chemistry, :financial]
      },
      standard_mission_pack: {
        inteligence: [:infopack, :laptop, :cellphone, :antenna],
        arsenal: [:remington_870, :colt_1911, :machete, :hatchet],
        items: [:handcuffs, :medipack, :chemistry, :financial]
      }
    }
  end

end


# Control class
class Control
  # Game mission control
  attr_accessor  :missions
  def initialize 
    @missions = Hash.new
    @states = [:paused, :aborted, :failed]
  end

  def new_mission(name, objective, pack)
    @missions[name] = [objective: objective, pack: pack, status: :active]
  end

  # Metaprogramming section:
  # Dinamically generate methods corresponding to each mission state
  # Created on the fly by using 'define_method', and used by game.rb
  # Methods:
  #  set_mission_to_paused
  #  set_mission_to_aborted
  #  set_mission_to_failed
  #

end


# Human class
class Human
  attr_accessor :id, :name, :personal_data, :professional_data
  def initialize
    @id = self.object_id            # Id of object when created
    @name                           # Name given by user when instantiated
    @personal_data = Hash.new       # Hash
    @professional_data              # kwargs 
  end

  # Metaprogramming section:
  # Dinamically generate methods corresponding to each mission state
  # Created on the fly by using 'define_method', and used by game.rb
  # Methods
  #   set_personal data
  #   set_professional_data
  # 
  
end

class Worker < Human
  attr_accessor :standard_shift, :extra_shift

  def initialize  
    @id = self.object_id
    @extra_shift = Hash.new
    @standard_shift = Hash.new
  end

  def set_worker_shifts
    @standard_shift = {
      id: @id,
      hours: 8,
      payment: 8,
      facility: String.new,
      status: nil
    }

    @extra_shift = {
      id: @id,
      hours: 0,
      payment: 0.0,
      facility: String.new,
      status: nil
    }
  end

end

# Depot tests
depot = Depot.new


# Control tests
puts '------------------'
puts 'Control tests'
puts '------------------'
control = Control.new()
name = :alpha
objective = 'Get Alpha to the base'
pack = :simple_trasportation_pack
control.new_mission(name, objective, depot.packs[pack])
puts control.missions[name]


# Human tests
puts '------------------'
puts 'Human class tests'
puts '------------------'

human = Human.new
puts human.id


# Worker tests
puts '------------------'
puts 'Worker class tests'
puts '------------------'

worker = Worker.new
worker.set_worker_shifts

puts worker.standard_shift
puts worker.extra_shift
puts "Hours class: #{worker.extra_shift[:payment].class}"
puts "Payment class: #{worker.extra_shift[:payment].class}"
# puts depot.packs[:simple_mission_pack]
# puts control.missions['alpha']
