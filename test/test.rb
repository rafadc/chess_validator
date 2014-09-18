require_relative '../board'


# wp = WhitePawn.new
# puts wp.can_move?("a2","a3")
# puts wp.can_move?("a2","a4")
# puts wp.can_move?("a2","a5")

 # bp = BlackPawn.new
 # puts bp.can_move?("a7","b6")
# puts bp.can_move?("a7","a5")
# puts bp.can_move?("a7","a4")

board1 = ChessBoard.new

smoves = File.open('simple_moves.txt', 'r')
smoves.each do |x|
  puts board1.check_move(x)
end
smoves.close


board2 = ChessBoard.new
board2.load_board("complex_board.txt")