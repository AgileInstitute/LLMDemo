class Board
  HORIZONTAL = 'horizontal'
  VERTICAL = 'vertical'

  ERROR_SHIP_BEGINS_BEYOND_BOARD = 'Ship begins beyond board!'
  ERROR_SHIP_EXTENDS_BEYOND_BOARD = 'Ship extends beyond board!'
  ERROR_ALREADY_SOMETHING_THERE = 'There is already something there!'
  ERROR_SHIPS_NOT_ADJACENT = 'Ships should not be adjacent!'

  def initialize
    @grid = Array.new(10) { Array.new(10) }
  end

  def place(ship, row, column, orientation)
    error_check_ship_starting_position(ship, row, column)
    error_check_ship_extent(ship, row, column, orientation)
    error_check_for_overlapping_ships(ship, row, column, orientation)
    error_check_for_adjacent_ships(ship, row, column, orientation)
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

  def ship_starting_position_okay?(ship, row, column)
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

  def error_check_for_overlapping_ships(ship, row, column, orientation)
    raise ERROR_ALREADY_SOMETHING_THERE unless no_overlapping_ships?(ship, row, column, orientation)
  end

  def no_overlapping_ships?(ship, row, column, orientation)
    ship.length.times do |i|
      check_row = orientation == VERTICAL ? row + i : row
      check_column = orientation == HORIZONTAL ? column + i : column
      return false if @grid[check_row][check_column]
    end
    true
  end

  def error_check_for_adjacent_ships(ship, row, column, orientation)
    raise ERROR_SHIPS_NOT_ADJACENT unless no_adjacent_ships?(ship, row, column, orientation)
  end

  def no_adjacent_ships?(ship, row, column, orientation)
    ship.length.times do |i|
      check_row = orientation == VERTICAL ? row + i : row
      check_column = orientation == HORIZONTAL ? column + i : column

      # Check all 8 adjacent positions around this cell
      (-1..1).each do |row_offset|
        (-1..1).each do |column_offset|
          next if row_offset == 0 && column_offset == 0 # Skip the cell itself

          adjacent_row = check_row + row_offset
          adjacent_column = check_column + column_offset

          # Skip if adjacent position is outside board bounds
          next if adjacent_row < 0 || adjacent_row >= 10 || adjacent_column < 0 || adjacent_column >= 10

          # Check if there's a ship in the adjacent position
          return false if @grid[adjacent_row][adjacent_column]
        end
      end
    end
    true
  end

  def place_ship_on_board(ship, row, column, orientation)
    ship.length.times do |zero_based_counter|
      cell_row = orientation == VERTICAL ? row + zero_based_counter : row
      cell_column = orientation == HORIZONTAL ? column + zero_based_counter : column
      @grid[cell_row][cell_column] = ship
    end
  end

end
