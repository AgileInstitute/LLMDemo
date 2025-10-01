module Check
end

class CheckShipsAdjacent
  def self.message
    'Ships should not be adjacent!'
  end

  def self.error_check(grid, ship, row, column, orientation)
    raise message unless okay?(grid, ship, row, column, orientation)
  end

  def self.okay?(grid, ship, row, column, orientation)
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
          return false if grid[adjacent_row][adjacent_column]
        end
      end
    end
    true
  end
end
