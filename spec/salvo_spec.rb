# frozen_string_literal: true

require 'salvo'

describe 'when placing ships on boards' do
  before(:each) do
    @board = Board.new
    @ship = Ship.new(1)
    @long_ship = Ship.new(3)
  end

  def expect_invalid_position(row, column, orientation = 'horizontal')
    expect { @board.place(@ship, row, column, orientation) }
      .to raise_error('Invalid board position!')
  end

  it 'will not place a ship adjacent to another one' do
    @board.place(@ship, 0, 0)
    expect { @board.place(Ship.new(1), 0, 1) }.to raise_error('Ships should not be adjacent!')
  end

  it 'will not place a ship if another one is already there' do
    @board.place(@ship, 0, 0)
    expect { @board.place(Ship.new(1), 0, 0) }.to raise_error('There is already something there!')
  end

  it 'with a bigger ship will not place a ship if another one is already there' do
    @board.place(@long_ship, 0, 0)
    expect { @board.place(Ship.new(1), 0, 2) }.to raise_error('There is already something there!')
  end

  it 'will place a ship where asked horizontally by default' do
    @board.place(@ship, 0, 0)
    expect(@board.whats_at(0, 0)).to eq(@ship)
  end

  it 'will place a ship where asked with explicit horizontal orientation' do
    @board.place(@ship, 0, 0, 'horizontal')
    expect(@board.whats_at(0, 0)).to eq(@ship)
  end

  it 'will place a ship where asked with vertical orientation' do
    @board.place(@ship, 0, 0, 'vertical')
    expect(@board.whats_at(0, 0)).to eq(@ship)
  end

  it 'will place a long ship horizontally' do
    @board.place(@long_ship, 0, 0, 'horizontal')
    expect(@board.whats_at(0, 0)).to eq(@long_ship)
    expect(@board.whats_at(0, 1)).to eq(@long_ship)
    expect(@board.whats_at(0, 2)).to eq(@long_ship)
    expect(@board.whats_at(0, 3)).to be_nil
  end

  it 'will place a long ship vertically' do
    @board.place(@long_ship, 0, 0, 'vertical')
    expect(@board.whats_at(0, 0)).to eq(@long_ship)
    expect(@board.whats_at(1, 0)).to eq(@long_ship)
    expect(@board.whats_at(2, 0)).to eq(@long_ship)
    expect(@board.whats_at(3, 0)).to be_nil
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

  it 'will NOT place a long ship horizontally if it extends beyond board' do
    expect { @board.place(@long_ship, 0, 8, 'horizontal') }
      .to raise_error('Ship extends beyond board!')
  end

  it 'will NOT place a long ship vertically if it extends beyond board' do
    expect { @board.place(@long_ship, 8, 0, 'vertical') }
      .to raise_error('Ship extends beyond board!')
  end

  it 'will NOT place a ship with invalid orientation' do
    expect { @board.place(@ship, 0, 0, 'diagonal') }
      .to raise_error('Invalid orientation!')
  end

  it 'will NOT place a horizontal ship if it collides with existing ship' do
    @board.place(@ship, 0, 1)
    expect { @board.place(@long_ship, 0, 0, 'horizontal') }
      .to raise_error('There is already something there!')
  end

  it 'will NOT place a vertical ship if it collides with existing ship' do
    @board.place(@ship, 1, 0)
    expect { @board.place(@long_ship, 0, 0, 'vertical') }
      .to raise_error('There is already something there!')
  end
end
