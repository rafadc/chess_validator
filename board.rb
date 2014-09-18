class ChessBoard
  def initialize
    @board = {"a1" => "wR", "b1" => "wN", "c1" => "wB" , "d1" => "wQ", "e1" => "wK", "f1" => "wB", "g1" => "wN", "h1" => "wR",
              "a2" => "wP", "b2" => "wP", "c2" => "wP" , "d2" => "wP", "e2" => "wP", "f2" => "wP", "g2" => "wP", "h2" => "wP",
              "a8" => "bR", "b8" => "bN", "c8" => "bB" , "d8" => "bQ", "e8" => "bK", "f8" => "bB", "g8" => "bN", "h8" => "bR", 
              "a7" => "bP", "b7" => "bP", "c7" => "bP" , "d7" => "bP", "e7" => "bP", "f7" => "bP", "g7" => "bP", "h7" => "bP"}
  end
  def check(move)
    origin = move.slice(0,2)
    destination = move.slice(0,3)
    return BlackPawn.new.can_move?(origin, destination) if  @board[origin]=="bP"
    return WhitePawn.new.can_move?(origin,destination) if  @board[origin]=="wP"
    return Knight.new.can_move?()
  end
end


# class Rook
#   def can_move?(origin,destination)
#     origin_row = origin.slice(1,1)
#     origin_col = origin.slice(0,1)
#     destination_row = destination.slice(1,1)
#     destination_col = destination.slice(0,1)
#     result = (destination_row == origin_row) || (destination_col == origin_col)
#   end
# end

class WhitePawn
  def can_move?(origin, destination)
    origin_row = origin.slice(1,1).to_i
    destination_row = destination.slice(1,1).to_i
    result = (destination_row == origin_row+1 && origin_row > 2) || (destination_row <= origin_row+2 && origin_row == 2)
  end
end

class BlackPawn
  def can_move?(origin, destination)
    origin_row = origin.slice(1,1).to_i
    destination_row = destination.slice(1,1).to_i
    result = (destination_row == origin_row-1 && origin_row < 7) || (destination_row >= origin_row-2 && origin_row == 7)
  end
end

class Knight
  def can_move?(origin, destination)
    origin_row = origin.slice(1,1).to_i
    origin_col = origin.slice(0,1).ord
    destination_row = destination.slice(1,1).to_i
    destination_col = destination.slice(0,1).ord

    result = ((origin_col +1 == destination_col) && (origin_row +2 == destination_row)) ||
    ((origin_col +2 == destination_col) && (origin_row +1 == destination_row)) ||
      ((origin_col +2 == destination_col) && (origin_row -1 == destination_row)) ||
      ((origin_col +1 == destination_col) && (origin_row -2 == destination_row)) ||
      ((origin_col -1 == destination_col) && (origin_row -2 == destination_row)) ||
      ((origin_col -2 == destination_col) && (origin_row -1 == destination_row)) ||
      ((origin_col -2 == destination_col) && (origin_row +1 == destination_row)) ||
      ((origin_col -1 == destination_col) && (origin_row +2 == destination_row))
  end
end
