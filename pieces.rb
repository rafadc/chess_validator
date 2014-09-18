class Piece

  def initialize(board, origin, destination)
    @board = board
    @origin = origin
    @destination = destination
  end

  def can_move?
    return BlackPawn.new(@origin, @destination).can_move? if ["bP"].include? @board[@origin]
    return WhitePawn.new(@origin, @destination).can_move? if ["wP"].include? @board[@origin]
    return Knight.new(@origin, @destination).can_move? if ["wN", "bN"].include? @board[@origin]
    return Rook.new(@origin, @destination).can_move? if ["wR", "bR"].include? @board[@origin]
    return Bishop.new(@origin, @destination).can_move? if ["wB", "bB"].include? @board[@origin]
    return Queen.new(@origin, @destination).can_move? if ["wB", "bB"].include? @board[@origin]
    return King.new(@origin, @destination).can_move? if ["wB", "bB"].include? @board[@origin]
  end
end

class MoveCoordinates
  def initialize(origin, destination)
    @origin_row = origin.slice(1,1).to_i
    @origin_col = origin.slice(0,1).ord
    @destination_row = destination.slice(1,1).to_i
    @destination_col = destination.slice(0,1).ord
  end
end

class WhitePawn < MoveCoordinates
  def can_move?
    (@origin_col == @destination_col) &&
        ((@destination_row == @origin_row+1 && @origin_row > 2) ||
        (@destination_row <= @origin_row+2 && @origin_row == 2))
  end
end

class BlackPawn < MoveCoordinates
  def can_move?
    (@origin_col == @destination_col) &&
            ((@destination_row == @origin_row-1 && @origin_row < 7) ||
              (@destination_row >= @origin_row-2 && @origin_row == 7))
  end
end

class Knight < MoveCoordinates
  def can_move?
    ((@origin_col +1 == @destination_col) && (@origin_row +2 == @destination_row)) ||
    ((@origin_col +2 == @destination_col) && (@origin_row +1 == @destination_row)) ||
      ((@origin_col +2 == @destination_col) && (@origin_row -1 == @destination_row)) ||
      ((@origin_col +1 == @destination_col) && (@origin_row -2 == @destination_row)) ||
      ((@origin_col -1 == @destination_col) && (@origin_row -2 == @destination_row)) ||
      ((@origin_col -2 == @destination_col) && (@origin_row -1 == @destination_row)) ||
      ((@origin_col -2 == @destination_col) && (@origin_row +1 == @destination_row)) ||
      ((@origin_col -1 == @destination_col) && (@origin_row +2 == @destination_row))
  end
end

class Rook < MoveCoordinates
  def can_move?
    (@origin_col == @destination_col) || (@origin_row == @destination_row)
  end
end

class Bishop < MoveCoordinates
  def can_move?
    (@origin_col - @destination_col).abs == (@origin_row - @destination_row).abs
  end
end

class Queen < MoveCoordinates
  def can_move?
    Bishop.new(@origin, @destination).can_move? || Rook.new(@origin, @destination).can_move?
  end
end

class King < MoveCoordinates
  def can_move?
    (@origin_col - @destination_col).abs <= 1 && (@origin_row - @destination_row).abs <= 1
  end
end

