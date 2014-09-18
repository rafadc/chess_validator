require_relative '../board'

# wp = WhitePawn.new
# puts wp.can_move?("a2","a3")
# puts wp.can_move?("a2","a4")
# puts wp.can_move?("a2","a5")

# bp = BlackPawn.new
# puts bp.can_move?("a7","a6")
# puts bp.can_move?("a7","a5")
# puts bp.can_move?("a7","a4")

# board1 = ChessBoard.new
# puts board1.check("a7 a6")
# puts board1.check("a7 a5")
# puts board1.check("a7 a4")
# puts board1.check("a2 a3")
# puts board1.check("a2 a4")
# puts board1.check("a2 a5")

horse = Knight.new

puts horse.can_move?("e5", "f7")
puts horse.can_move?("e5", "g6")
puts horse.can_move?("e5", "g4")
puts horse.can_move?("e5", "f3")
puts horse.can_move?("e5", "d3")
puts horse.can_move?("e5", "c4")
puts horse.can_move?("e5", "d7")
puts horse.can_move?("e5", "c6")


puts horse.can_move?("e5", "g9")






