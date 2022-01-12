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

    def set_worker_data name, type, data
        begin
            @board[:players][name].send("set_#{type}_data", data)
        rescue NoMethodError
            puts 'Worker or type of data not found'
        end
    end
    
    def estimate_payment_extra_hours worker, hours
      begin
        base_payment = @board[:players][worker].standard_shift[:payment]
        total = base_payment * hours
      rescue TypeError
        puts 'Hours must be of type Integer'
      end
    end
  end
  

e = ErrorTest.new
test = e.new_worker
p test
ana = e.new_worker(name: :Ana)
p ana
e.set_worker_data :ana, "personal", {surname: 'Porras', age: 27}
p ana
ana.initialize_shifts
p ana
begin
  e.estimate_payment_extra_hours
rescue ArgumentError
  puts 'Wrong number of arguments'
end
e.estimate_payment_extra_hours :Ana, "9"
