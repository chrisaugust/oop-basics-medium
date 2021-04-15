# class Machine
#   attr_writer :switch
# 
#   def start
#     self.flip_switch(:on)
#   end
# 
#   def stop
#     self.flip_switch(:off)
#   end
# 
#   def flip_switch(desired_state)
#     self.switch = desired_state
#   end
# end
# 
# Modify this class so both flip_switch and the setter method switch= are private methods.

class Machine
  def initialize
    @switch = :off
  end

  def start
    self.flip_switch(:on)
  end

  def stop
    self.flip_switch(:off)
  end

  def status
    puts "The machine is currently #{switch}"
  end

  private

  attr_accessor :switch

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

m = Machine.new
m.status

m.start
m.status

m.stop
m.status

