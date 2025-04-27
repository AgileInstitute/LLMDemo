class Shield
  def initialize
    @energy_level = 5000
    @is_up = false
  end

  def receive(amount)
    temp_energy = @energy_level + amount
    @energy_level = [temp_energy, 10000].min
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
