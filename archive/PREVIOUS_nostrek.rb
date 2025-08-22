class Shield
  MAX_ENERGY = 10000
  INITIAL_ENERGY = 5000

  def initialize
    @energy_level = INITIAL_ENERGY
    @up = false
  end

  def receive(amount)
    @energy_level = [@energy_level + amount, MAX_ENERGY].min
  end

  def energy_level
    @energy_level
  end

  def raise
    @up = true
  end

  def up?
    @up
  end
end