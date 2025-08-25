# frozen_string_literal: true

require 'salvo'

describe 'when placing ships on boards' do
  before(:each) do
    @board = Board.new
    @ship = Ship.new(1)
  end

  def expect_invalid_position(row, column)
    expect { @board.place(@ship, row, column) }
      .to raise_error('Invalid board position!')
  end

  it 'will not place a ship if another one is already there' do
    @board.place(@ship, 0, 0)
    expect { @board.place(Ship.new(1), 0, 0) }.to raise_error('There is already something there!')
  end

  it 'with a bigger ship will not place a ship if another one is already there' do
    @board.place(@ship, 0, 0)
    expect { @board.place(Ship.new(2), 0, 0) }.to raise_error('There is already something there!')
  end

  it 'will place a ship where asked' do
    @board.place(@ship, 0, 0)
    expect(@board.whats_at(0, 0)).to eq(@ship)
  end

  it 'will NOT place a ship off the board when negative row' do
    expect_invalid_position(-1, 0)
  end

  it 'will NOT place a ship when column out of bounds' do
    expect_invalid_position(0, 10)
  end

  it 'will NOT place a ship when row out of bounds' do
    expect_invalid_position(10, 9)
  end

  it 'will NOT place a ship when negative column' do
    expect_invalid_position(9, -1)
  end
end
