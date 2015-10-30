require 'Pry'

class Board
  def initialize
    @grid = [
      [:bR, :bN, :bB, :bQ, :bK, :bB, :bN, :bR],
      [:bP, :bP, :bP, :bP, :bP, :bP, :bP, :bP],
      [nil, nil, nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, nil, nil],
      [:wP, :wP, :wP, :wP, :wP, :wP, :wP, :wP],
      [:wR, :wN, :wB, :wQ, :wK, :wB, :wN, :wR]
    ]
    @pieces = {
      bR: Rook,
      bN: Knight,
      bB: Bishop,
      bQ: Queen,
      bK: King,
      bP: Pawn
    }
    binding.pry
  end

  def move(origin, destination)
    return false if origin == destination
    @pieces[@grid[origin[0]][origin[1]]].validate_move(origin, destination);
  end
end

class Rook
  def self.validate_move(origin, destination)
    origin[0] == destination[0] || origin [1] == destination [1]
  end
end


class Pawn
  def self.validate_move(origin, destination)
    return first_movement if (origin[0] - destination[0]) == 2
    (origin[0] - destination[0]) == 1 && (origin[1] == destination[1])
  end

  def first_movement
    (origin[0] - destination[0]) == 2 && (origin[1] == destination[1])
  end
end

class King
  def self.validate_move(origin, destination)
    origin[0] == destination[0] || origin [1] == destination [1]
  end
end

class Knight
  def self.validate_move(origin, destination)
    if (origin[0]-destination[0]).abs == 1
      (origin[1]-destination[1]).abs == 2
    else (origin[0]-destination[0]) == 2
      (origin[1]-destination[1]).abs == 1
    end
  end
end

class Bishop
  def self.validate_move(origin, destination)
    (origin[0]-destination[0]).abs == (origin[1]-destination[1]).abs
  end
end

class Queen
  def self.validate_move(origin, destination)
    if (origin[0]-destination[0]).abs == (origin[1]-destination[1]).abs
      true
    else
      origin[0] == destination[0] || origin [1] == destination [1]
    end
  end
end

board = Board.new()
