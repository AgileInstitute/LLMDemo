# frozen_string_literal: true

require 'salvo'

describe 'when placing ships on boards' do
  before(:each) do
    @board = Board.new
    @ship = Ship.new(1)
  end

  it 'will place a ship where asked' do
    @board.place(@ship, 0, 0)
    expect(@board.whats_at(0, 0)).to eq(@ship)
  end

  it 'will NOT place a ship off the board when negative row' do
    expect { @board.place(@ship, -1, 0) }
      .to raise_error('Invalid board position!')
  end

  it 'will NOT place a ship when column out of bounds' do
    expect { @board.place(@ship, 0, 10) }
      .to raise_error('Invalid board position!')
  end

  it 'will NOT place a ship when row out of bounds' do
    expect { @board.place(@ship, 10, 9) }
      .to raise_error('Invalid board position!')
  end

  it 'will NOT place a ship when negative column' do
    expect { @board.place(@ship, 9, -1) }
      .to raise_error('Invalid board position!')
  end
end
