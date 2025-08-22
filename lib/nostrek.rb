class Shield
  MAX_ENERGY_LEVEL = 10000
  INITIAL_ENERGY_LEVEL = 5000

  def initialize
    @energy_level = INITIAL_ENERGY_LEVEL
    @is_up = false
  end

  def receive(energy)
    new_energy_level = @energy_level + energy
    @energy_level = [new_energy_level, MAX_ENERGY_LEVEL].min
  end

  def energy_level
    @energy_level
  end

  def raise
    @is_up = true
  end

  def up?
    @is_up
  end
end