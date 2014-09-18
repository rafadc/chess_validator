class PieceFactory
  def self.for(description, origin, destination)
    return BlackPawn.new(origin, destination) if ["bP"].include? description
    return WhitePawn.new(origin, destination) if ["wP"].include? description
    return Knight.new(origin, destination) if ["wN", "bN"].include? description
    return Rook.new(origin, destination) if ["wR", "bR"].include? description
    return Bishop.new(origin, destination) if ["wB", "bB"].include? description
    return Queen.new(origin, destination) if ["wB", "bB"].include? description
    return King.new(origin, destination) if ["wB", "bB"].include? description
  end
end