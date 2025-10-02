# frozen_string_literal: true

require 'board'

class Autopilot
  def initialize(random_generator)
    @random_generator = random_generator
  end

  def unchecked_position
    row = @random_generator.rand(9)
    column = @random_generator.rand(9)
    Position.new(row, column)
  end
end
