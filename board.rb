require 'pry'

class ChessBoard
  def initialize
    @board = {
      "a8" => "bR", "b8" => "bN", "c8" => "bB" , "d8" => "bQ", "e8" => "bK", "f8" => "bB", "g8" => "bN", "h8" => "bR", 
      "a7" => "bP", "b7" => "bP", "c7" => "bP" , "d7" => "bP", "e7" => "bP", "f7" => "bP", "g7" => "bP", "h7" => "bP",
      "a6" => "--", "b6" => "--", "c6" => "--" , "d6" => "--", "e6" => "--", "f6" => "--", "g6" => "--", "h6" => "--",
      "a5" => "--", "b5" => "--", "c5" => "--" , "d5" => "--", "e5" => "--", "f5" => "--", "g5" => "--", "h5" => "--",
      "a4" => "--", "b4" => "--", "c4" => "--" , "d4" => "--", "e4" => "--", "f4" => "--", "g4" => "--", "h4" => "--",
      "a3" => "--", "b3" => "--", "c3" => "--" , "d3" => "--", "e3" => "--", "f3" => "--", "g3" => "--", "h3" => "--",
      "a2" => "wP", "b2" => "wP", "c2" => "wP" , "d2" => "wP", "e2" => "wP", "f2" => "wP", "g2" => "wP", "h2" => "wP",
      "a1" => "wR", "b1" => "wN", "c1" => "wB" , "d1" => "wQ", "e1" => "wK", "f1" => "wB", "g1" => "wN", "h1" => "wR"
            }
  end

  def check_move(move)
    origin = move.slice(0,2)
    destination = move.slice(3,2)
    Piece.new(@board, origin, destination).can_move? && destination_free(destination)? "LEGAL" : "ILLEGAL"
  end

  def destination_free(destination)
    @board[destination] == "--"
  end

  def load_board(file)
    # unfinished !!!!!!!!!!!!!!!!!!!!!!!!!!
    file = File.open(file, 'r')
    file.each do |line|
      row = line.split(" ")

    end
    file.close
  end


end
# class Rook
#   def can_move?(origin,destination)
#     @origin_row = @origin.slice(1,1)
#     @origin_col = @origin.slice(0,1)
#     @destination_row = @destination.slice(1,1)
#     @destination_col = @destination.slice(0,1)
#     result = (@destination_row == @origin_row) || (@destination_col == @origin_col)
#   end
# end
class Piece

  def initialize(board, origin, destination)
    @board = board
    @origin = origin
    @destination = destination
  end

  def can_move?
    return BlackPawn.new(@origin, @destination).can_move? if @board[@origin]=="bP"
    return WhitePawn.new(@origin, @destination).can_move? if @board[@origin]=="wP"
    return Knight.new(@origin, @destination).can_move? if ["wN", "bN"].include? @board[@origin]
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
    result =  (@origin_col == @destination_col) && 
        ((@destination_row == @origin_row+1 && @origin_row > 2) || 
        (@destination_row <= @origin_row+2 && @origin_row == 2))
  end
end

class BlackPawn < MoveCoordinates
  def can_move?
    result =  (@origin_col == @destination_col) && 
            ((@destination_row == @origin_row-1 && @origin_row < 7) || 
              (@destination_row >= @origin_row-2 && @origin_row == 7))
  end
end

class Knight < MoveCoordinates
  def can_move?
    result = ((@origin_col +1 == @destination_col) && (@origin_row +2 == @destination_row)) ||
    ((@origin_col +2 == @destination_col) && (@origin_row +1 == @destination_row)) ||
      ((@origin_col +2 == @destination_col) && (@origin_row -1 == @destination_row)) ||
      ((@origin_col +1 == @destination_col) && (@origin_row -2 == @destination_row)) ||
      ((@origin_col -1 == @destination_col) && (@origin_row -2 == @destination_row)) ||
      ((@origin_col -2 == @destination_col) && (@origin_row -1 == @destination_row)) ||
      ((@origin_col -2 == @destination_col) && (@origin_row +1 == @destination_row)) ||
      ((@origin_col -1 == @destination_col) && (@origin_row +2 == @destination_row))
  end
end
