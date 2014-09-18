class PieceFactory
  def self.for(board, origin, destination)
    return BlackPawn.new(origin, destination) if ["bP"].include? board[origin]
    return WhitePawn.new(origin, destination) if ["wP"].include? board[origin]
    return Knight.new(origin, destination) if ["wN", "bN"].include? board[origin]
    return Rook.new(origin, destination) if ["wR", "bR"].include? board[origin]
    return Bishop.new(origin, destination) if ["wB", "bB"].include? board[origin]
    return Queen.new(origin, destination) if ["wB", "bB"].include? board[origin]
    return King.new(origin, destination) if ["wB", "bB"].include? board[origin]
  end
end