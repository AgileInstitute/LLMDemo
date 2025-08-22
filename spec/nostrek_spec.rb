# frozen_string_literal: true

require 'nostrek'

describe 'nostalgic trek' do
  describe 'shields' do
    before(:each) do
      @shield = Shield.new
    end

    it 'cannot receive more than max" do
      @shield.receive(6000)
      expect(@shield.energy_level).to be 10_000
    end

    it 'can receive max energy' do
      @shield.receive(5000)
      expect(@shield.energy_level).to be 10_000
    end

    it 'starts out with some energy' do
      expect(@shield.energy_level).to be 5000
    end

    it 'starts out lowered' do
      expect(@shield.up?).to be false
    end

    it 'can be raised' do
      @shield.raise
      expect(@shield.up?).to be true
    end
  end
end
