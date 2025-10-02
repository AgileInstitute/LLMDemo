require_relative 'errors'

class Board
  HORIZONTAL = 'horizontal'
  VERTICAL = 'vertical'

  ERROR_SHIP_BEGINS_BEYOND_BOARD = 'Ship begins beyond board!'
  ERROR_SHIP_EXTENDS_BEYOND_BOARD = 'Ship extends beyond board!'

  def initialize
    @grid = Array.new(10) { Array.new(10) }
  end

  def place(ship, row, column, orientation)
    error_check_ship_starting_position(ship, row, column)
    error_check_ship_extent(ship, row, column, orientation)
    CheckOverlapping.new.error_check(@grid, ship, row, column, orientation)
    CheckShipsAdjacent.new.error_check(@grid, ship, row, column, orientation)
    place_ship_on_board(ship, row, column, orientation)
  end

  def whats_at(row, column)
    @grid[row][column]
  end

  private

  def ship_orientation_okay?(orientation)
    [HORIZONTAL, VERTICAL].include?(orientation)
  end

  def error_check_ship_starting_position(ship, row, column)
    raise ERROR_SHIP_BEGINS_BEYOND_BOARD unless ship_starting_position_okay?(ship, row, column)
  end

  def ship_starting_position_okay?(_ship, row, column)
    row >= 0 && column >= 0 && row <= 9 && column <= 9
  end

  def error_check_ship_extent(ship, row, column, orientation)
    raise ERROR_SHIP_EXTENDS_BEYOND_BOARD unless ship_extent_okay?(ship, row, column, orientation)
  end

  def ship_extent_okay?(ship, row, column, orientation)
    if orientation == HORIZONTAL
      column + (ship.length - 1) <= 9
    else # vertical
      row + (ship.length - 1) <= 9
    end
  end

  def place_ship_on_board(ship, row, column, orientation)
    ship.length.times do |zero_based_counter|
      cell_row = orientation == VERTICAL ? row + zero_based_counter : row
      cell_column = orientation == HORIZONTAL ? column + zero_based_counter : column
      @grid[cell_row][cell_column] = ship
    end
  end
end
