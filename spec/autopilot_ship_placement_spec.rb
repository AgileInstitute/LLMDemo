# frozen_string_literal: true

require 'board'
require 'ship'
require 'errors'
require 'autopilot'

describe 'how autopilot places ships on the board' do
  before(:each) do
    @random_generator = instance_double(Random)
    @autopilot = Autopilot.new(@random_generator)
  end

  describe 'creating a random board position' do
    it 'calls a random number generator requesting a random row and column' do
      allow(@random_generator).to receive(:rand).with(9).and_return(4, 5)
      @autopilot.unchecked_position
      expect(@random_generator).to have_received(:rand).with(9).twice
    end

    it 'returns a position object' do
      allow(@random_generator).to receive(:rand).with(9).and_return(4, 5)
      position = @autopilot.unchecked_position
      expect(position.row).to eq(4)
      expect(position.column).to eq(5)
    end
  end
end
