require_relative './piece_factory'

class Piece

  def initialize(origin, destination)
    @origin = origin
    @destination = destination
  end

  def origin_col
    @origin[0].ord
  end

  def origin_row
    @origin[1].to_i
  end

  def destination_col
    @destination[0].ord
  end

  def destination_row
    @destination[1].to_i
  end
end

class WhitePawn < Piece
  def can_move?
    (origin_col == destination_col) &&
        ((destination_row == origin_row+1 && origin_row > 2) ||
        (destination_row <= origin_row+2 && origin_row == 2))
  end
end

class BlackPawn < Piece
  def can_move?
    (origin_col == destination_col) &&
            ((destination_row == origin_row-1 && origin_row < 7) ||
              (destination_row >= origin_row-2 && origin_row == 7))
  end
end

class Knight < Piece
  def can_move?
    ((origin_col + 1 == destination_col) && (origin_row + 2 == destination_row)) ||
    ((origin_col + 2 == destination_col) && (origin_row + 1 == destination_row)) ||
      ((origin_col + 2 == destination_col) && (origin_row - 1 == destination_row)) ||
      ((origin_col + 1 == destination_col) && (origin_row - 2 == destination_row)) ||
      ((origin_col - 1 == destination_col) && (origin_row - 2 == destination_row)) ||
      ((origin_col - 2 == destination_col) && (origin_row - 1 == destination_row)) ||
      ((origin_col - 2 == destination_col) && (origin_row + 1 == destination_row)) ||
      ((origin_col - 1 == destination_col) && (origin_row + 2 == destination_row))
  end
end

class Rook < Piece
  def can_move?
    (origin_col == destination_col) || (origin_row == destination_row)
  end
end

class Bishop < Piece
  def can_move?
    (origin_col - destination_col).abs == (origin_row - destination_row).abs
  end
end

class Queen < Piece
  def can_move?
    Bishop.new(@origin, @destination).can_move? || Rook.new(@origin, @destination).can_move?
  end
end

class King < Piece
  def can_move?
    (origin_col - destination_col).abs <= 1 && (origin_row - destination_row).abs <= 1
  end
end

