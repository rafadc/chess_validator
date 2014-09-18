require_relative '../board'

board1 = ChessBoard.new
board1.print_board
smoves = File.open('simple_moves.txt', 'r')
smoves.each do |x|
  puts x.chomp + " is " + board1.check_move(x)
end
smoves.close
