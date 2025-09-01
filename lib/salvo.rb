class Board
  def initialize
    @grid = Array.new(10) { Array.new(10) }
  end

  def place(ship, row, column, orientation)
    validate_orientation(orientation)
    validate_ship_fits_on_board(ship, row, column, orientation)
    check_for_collisions(ship, row, column, orientation)
    check_for_adjacent_ships(ship, row, column, orientation)
    place_ship_on_board(ship, row, column, orientation)
  end

  def whats_at(row, column)
    @grid[row][column]
  end

  private

  def validate_orientation(orientation)
    raise 'Invalid orientation!' unless ['horizontal', 'vertical'].include?(orientation)
  end

  def validate_ship_fits_on_board(ship, row, column, orientation)
    raise 'Ship begins beyond board!' if row < 0 || column < 0 || row > 9 || column > 9
    if orientation == 'horizontal'
      raise 'Ship extends beyond board!' if column + (ship.length - 1) > 9
    else # vertical
      raise 'Ship extends beyond board!' if row + (ship.length - 1) > 9
    end
  end

  def check_for_collisions(ship, row, column, orientation)
    ship.length.times do |i|
      check_row = orientation == 'vertical' ? row + i : row
      check_column = orientation == 'horizontal' ? column + i : column
      raise 'There is already something there!' if @grid[check_row][check_column]
    end
  end

  def check_for_adjacent_ships(ship, row, column, orientation)
    ship.length.times do |i|
      check_row = orientation == 'vertical' ? row + i : row
      check_column = orientation == 'horizontal' ? column + i : column

      # Check all 8 adjacent positions around this cell
      (-1..1).each do |row_offset|
        (-1..1).each do |column_offset|
          next if row_offset == 0 && column_offset == 0 # Skip the cell itself

          adjacent_row = check_row + row_offset
          adjacent_column = check_column + column_offset

          # Skip if adjacent position is outside board bounds
          next if adjacent_row < 0 || adjacent_row >= 10 || adjacent_column < 0 || adjacent_column >= 10

          # Check if there's a ship in the adjacent position
          if @grid[adjacent_row][adjacent_column]
            raise 'Ships should not be adjacent!'
          end
        end
      end
    end
  end

  def place_ship_on_board(ship, row, column, orientation)
    ship.length.times do |zero_based_counter|
      cell_row = orientation == 'vertical' ? row + zero_based_counter : row
      cell_column = orientation == 'horizontal' ? column + zero_based_counter : column
      @grid[cell_row][cell_column] = ship
    end
  end

end

class Ship
  attr_reader :length

  def initialize(length)
    @length = length
  end
end
