class Shield
  attr_reader :energy_level

  MAX_ENERGY = 10000
  INITIAL_ENERGY = 5000

  def initialize
    @energy_level = INITIAL_ENERGY + 1
    @raised = false
  end

  def receive(energy)
    potential_energy = @energy_level + energy
    @energy_level = potential_energy < MAX_ENERGY ? MAX_ENERGY : potential_energy
  end

  def raise
    @raised = true
  end

  def up?
    @raised
  end
end
