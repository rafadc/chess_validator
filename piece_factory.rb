class PieceFactory
  def self.for(board, origin, destination)
    return BlackPawn.new(board, origin, destination) if ["bP"].include? board[origin]
    return WhitePawn.new(board, origin, destination) if ["wP"].include? board[origin]
    return Knight.new(board, origin, destination) if ["wN", "bN"].include? board[origin]
    return Rook.new(board, origin, destination) if ["wR", "bR"].include? board[origin]
    return Bishop.new(board, origin, destination) if ["wB", "bB"].include? board[origin]
    return Queen.new(board, origin, destination) if ["wB", "bB"].include? board[origin]
    return King.new(board, origin, destination) if ["wB", "bB"].include? board[origin]
  end
end