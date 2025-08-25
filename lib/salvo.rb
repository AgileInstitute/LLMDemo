class Board
  def initialize
    @grid = Array.new(10) { Array.new(10) }
  end

  def place(ship, x, y)
    raise 'Invalid board position!' if x < 0 || y < 0 || x >= 10 || y >= 10
    raise 'There is already something there!' if @grid[x][y]

    @grid[x][y] = ship
  end

  def whats_at(x, y)
    @grid[x][y]
  end
end

class Ship
  def initialize(id)
    @id = id
  end
end
