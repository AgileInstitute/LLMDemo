class Ship
    def initialize(size)
        @size = size
    end
end

class Board
    def initialize
        @ships = {}
    end

    def place(ship, row:, column:)
        raise "Invalid board position!" if row < 0 || column < 0

        @ships[[row, column]] = ship
    end

    def whats_at(row:, column:)
        @ships[[row, column]]
    end
end